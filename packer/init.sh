#!/usr/bin/env bash

cd "$(dirname ${BASH_SOURCE[0]})"
git clone git@github.com:chef/bento.git
cd "bento"
git pull upstream master
cd ../..

. ./platform-properties.sh
cd "$(dirname ${BASH_SOURCE[0]})/bento/packer_templates/$distro"


if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # do not work for now...
  echo "not implemented for linux, PR welcomed!"
  PACKER_VM_DRIVER=qemu
elif [[ "$OSTYPE" == "darwin"* ]]; then
  PACKER_VM_DRIVER=virtualbox-iso
. ./init-mac.sh
fi


packer build -var "box_basename=$distroversion" -only=$PACKER_VM_DRIVER $distroversion.json

