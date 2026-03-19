#!/bin/bash

set -Eeu -o pipefail

# https://apichallenges.eviltester.com
# https://fakerestapi.azurewebsites.net

workdir=playbook

docker run -it --rm \
  -v "${PWD}":"/${workdir}" \
  -w "/${workdir}" \
  -e host_uid="${UID}" \
  -e host_gid="$(id -g)" \
  --entrypoint=ansible-playbook \
  alse-ansible:1.7.5_2.10.17 \
    -i localhost, "$@"

: <<CMT
podman run -it --rm \
  -v "${PWD}":"/${workdir}" \
  -w "/${workdir}" \
  --entrypoint=ansible-playbook \
  alse-ansible:1.7.5_2.10.17 \
    -i localhost, "$@"
CMT
