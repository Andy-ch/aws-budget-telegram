#!/bin/bash
set -xe
docker run --rm -v "$(pwd):/project" -w /project hashicorp/terraform fmt
