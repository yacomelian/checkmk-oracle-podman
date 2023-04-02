#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DSTPATH=/omd/sites
OMDPATH=$SCRIPT_DIR/omd/

mkdir -p $SCRIPT_DIR/omd/sites/cmk/ > /dev/null

podman run -dit \
	-p 8080:5000 \
	-p 8000:8000 \
	--cap-add NET_RAW \
	--cap-add=SYS_PTRACE \
	--network slirp4netns:allow_host_loopback=true \
	--tmpfs $OMDPATH/sites/cmk/tmp,uid=1000,gid=1000 \
	-v monitoring:$DSTPATH --name monitoring \
	-v /etc/localtime:/etc/localtime:ro --restart always \
	checkmk/check-mk-raw:2.1.0p25


