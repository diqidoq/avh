#!/bin/bash
#
# 2012 (c) diqidoq, for MAROQQO digital media
#

tD=~/bin2

installAVH(){
  sudo cp avh.sh "${tD}"/avh
  sudo chmod -R 776 "${tD}" "${tD}"/avh
  sudo chmod a+x "${tD}"/avh
  echo "${tD}/avh insalled and permission set executable (chmod a+x)."
}

if [ -d "${tD}" ]; then
  installAVH
else
  mkdir "${tD}"
  chmod 775 "${tD}"
  echo "${tD} created"
  installAVH
fi
