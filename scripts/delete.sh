#!/bin/bash 


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

podman stop monitoring
podman  rm monitoring
rm -rf $SCRIPT_DIR/omd/
mkdir -p $SCRIPT_DIR/omd/sites/cmk/ > /dev/null
