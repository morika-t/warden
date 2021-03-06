#!/bin/bash

[ -n "$DEBUG" ] && set -o xtrace
set -o nounset
set -o errexit
shopt -s nullglob

cd $(dirname "$0")

if [ -z "${1}" ]; then
  echo "Usage: ${0} <instance_path>"
  exit 1
fi

target=${1}

if [ -d ${target} ]; then
  echo "\"${target}\" already exists, aborting..."
  exit 1
fi

cp -r skeleton "${target}"
"${target}"/setup.sh
echo ${target}
