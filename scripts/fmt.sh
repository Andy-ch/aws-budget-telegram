#!/bin/bash
set -xe
mv secrets.auto.tfvars secrets.auto.tfvars.enc
docker run --rm -v "$(pwd):/project" -w /project hashicorp/terraform fmt
mv secrets.auto.tfvars.enc secrets.auto.tfvars
