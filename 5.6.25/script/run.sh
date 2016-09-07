#!/usr/bin/env bash
#
# Run php in a container
#
# This script will attempt to mirror the host paths by using volumes for the
# following paths:
#   * $(pwd)
#

set -e

VERSION="5.6.25"
IMAGE="cosmicvelocity/php:$VERSION"

if [ "$(pwd)" != '/' ]; then
    VOLUMES="-v $(pwd):$(pwd)"
fi

exec docker run --rm $VOLUMES -w "$(pwd)" $IMAGE "$@"
