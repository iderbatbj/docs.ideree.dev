#!/usr/bin/env bash
set -euo pipefail


## --- Base --- ##
_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-"$0"}")" >/dev/null 2>&1 && pwd -P)"
_PROJECT_DIR="$(cd "${_SCRIPT_DIR}/.." >/dev/null 2>&1 && pwd)"
cd "${_PROJECT_DIR}" || exit 2


# shellcheck disable=SC1091
[ -f .env ] && . .env


if ! command -v mkdocs >/dev/null 2>&1; then
	echo "[ERROR]: Not found 'mkdocs' command, please install it first!" >&2
	exit 1
fi

# if ! command -v mike >/dev/null 2>&1; then
# 	echo "[ERROR]: Not found 'mike' command, please install it first!" >&2
# 	exit 1
# fi
## --- Base --- ##


## --- Main --- ##
echo "[INFO]: Starting documentation server..."
#shellcheck disable=SC2086
mkdocs serve -a 0.0.0.0:${DOCS_PORT:-8000} --livereload || exit 2
# mike serve -a 0.0.0.0:${DOCS_PORT:-8000} || exit 2
echo "[OK]: Done."
## --- Main --- ##
