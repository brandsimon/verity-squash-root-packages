#!/usr/bin/env sh
dir="$(realpath --relative-to=. "$1")"
changelog="${dir}/debian/changelog"
if [ ! -f "${changelog}" ]; then
	echo "No changelog found"
	exit 1
fi
set -e
version="$(dpkg-parsechangelog --show-field Version -l "${changelog}")"
pkg_name="$(dpkg-parsechangelog --show-field Source -l "${changelog}")"
stripped_version="$(printf "%s" "${version}" | cut -f -1 -d '-')"
tar_filename="${pkg_name}_${stripped_version}.orig.tar"
find "${dir}" -name '*.pyc' -delete
tar cf "${tar_filename}" --exclude="${dir}/.git" --exclude="${dir}/.venv" "${dir}"
xz -0 "${tar_filename}"
dpkg-source -i'^(.venv)|(.git)' -b "${dir}"
