#!/bin/bash

# This script gets the version strings for q2pro, q2admin and aq2-tng
package_version=$1

q2pro () {
  q2pro_path=q2pro
  cd ${q2pro_path}
  q2pro_version=$(./version.sh  | head -n 1)
  echo "q2pro_version=${q2pro_version}"
}

q2admin () {
  q2admin_path=q2admin
  cd ${q2admin_path}
  q2admin_revision=$(grep REL_VERSION Makefile | head -n 1 | cut -f 2 -d '=')
  q2admin_version=$(git rev-parse --short HEAD)
  echo "q2admin_version=${q2admin_revision}~${q2admin_version}"
}

tng () {
  tng_path=aq2-tng/source
  cd ${tng_path}
  tng_revision=$(git show -s --format='%cd' --date=short)
  tng_version=$(git rev-parse --short HEAD)
  echo "aq2-tng_version=${tng_revision}~${tng_version}"
}

$package_version
