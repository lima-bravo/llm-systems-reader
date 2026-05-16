#!/usr/bin/env bash
# Build LaTeX targets listed in targets.txt into ./build, then stage outputs
# under PDF/. Copies are skipped when the destination already matches the
# freshly built file (byte-for-byte).
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
targets_file="${repo_root}/targets.txt"
build_dir="${repo_root}/build"
pdf_out="${repo_root}/PDF"
failures=0
targets=()

if ! command -v latexmk >/dev/null 2>&1; then
  echo "build-pdfs: latexmk not found in PATH" >&2
  exit 1
fi

if [[ ! -f "${targets_file}" ]]; then
  echo "build-pdfs: missing ${targets_file}" >&2
  exit 1
fi

while IFS= read -r line || [[ -n "${line}" ]]; do
  line="${line%%#*}"
  line="$(echo "${line}" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
  [[ -z "${line}" ]] && continue
  targets+=("${line}")
done < "${targets_file}"

if ((${#targets[@]} == 0)); then
  echo "build-pdfs: no targets in ${targets_file}" >&2
  exit 1
fi

latexmk_common=(
  -pdf
  -interaction=nonstopmode
  -halt-on-error
  -file-line-error
  -cd
)

build_target() {
  local rel_pdf="$1"
  local rel_tex="${rel_pdf%.pdf}.tex"
  local tex_path="${repo_root}/${rel_tex}"
  local out_subdir="${build_dir}/$(dirname "${rel_pdf}")"

  if [[ ! -f "${tex_path}" ]]; then
    echo "build-pdfs: skip ${rel_pdf} (no ${rel_tex})" >&2
    failures=$((failures + 1))
    return 1
  fi

  mkdir -p "${out_subdir}"

  echo "build-pdfs: latexmk ${rel_tex} -> build/${rel_pdf}"
  if ! (
    cd "${build_dir}"
    latexmk "${latexmk_common[@]}" \
      -outdir="${out_subdir}" \
      -auxdir="${out_subdir}" \
      "${tex_path}"
  ); then
    echo "build-pdfs: FAILED ${rel_pdf}" >&2
    failures=$((failures + 1))
    return 1
  fi
}

copy_if_changed() {
  local src="$1"
  local dest="$2"
  local dest_name="${dest#"${pdf_out}/"}"

  if [[ ! -f "${src}" ]]; then
    echo "build-pdfs: missing built file ${src#"${repo_root}/"}" >&2
    failures=$((failures + 1))
    return 1
  fi

  mkdir -p "$(dirname "${dest}")"

  if [[ -f "${dest}" ]] && cmp -s "${src}" "${dest}"; then
    echo "build-pdfs: unchanged ${dest_name}"
    return 0
  fi

  cp "${src}" "${dest}"
  echo "build-pdfs: copied ${dest_name}"
}

echo "build-pdfs: ${#targets[@]} target(s); build -> ${build_dir}/; stage -> ${pdf_out}/"
mkdir -p "${build_dir}" "${pdf_out}"

for rel_pdf in "${targets[@]}"; do
  build_target "${rel_pdf}" || true
done

for rel_pdf in "${targets[@]}"; do
  copy_if_changed "${build_dir}/${rel_pdf}" "${pdf_out}/${rel_pdf}" || true
done

if ((failures > 0)); then
  echo "build-pdfs: finished with ${failures} error(s)" >&2
  exit 1
fi

echo "build-pdfs: done"
