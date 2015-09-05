#!/bin/bash
set -e

declare -A aliases
aliases=(
	[1.8]='1'
	[2.5]='2'
	[3.3]='3 latest'
)

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( */ )
versions=( "${versions[@]%/}" )
url='git://github.com/nodejs/docker-iojs'

echo '# maintainer: io.js Docker team <https://github.com/nodejs/docker-iojs> (@iojs)'

for version in "${versions[@]}"; do
	commit="$(git log -1 --format='format:%H' -- "$version")"
	fullVersion="$(grep -m1 'ENV IOJS_VERSION ' "$version/Dockerfile" | cut -d' ' -f3)"
	versionAliases=( $fullVersion $version ${aliases[$version]} )

	echo
	for va in "${versionAliases[@]}"; do
		echo "$va: ${url}@${commit} $version"
	done

	for variant in onbuild slim; do
		commit="$(git log -1 --format='format:%H' -- "$version/$variant")"
		echo
		for va in "${versionAliases[@]}"; do
			if [ "$va" = 'latest' ]; then
				va="$variant"
			else
				va="$va-$variant"
			fi
			echo "$va: ${url}@${commit} $version/$variant"
		done
	done
done
