#!/bin/bash

OMDPATH=/home/poduser/checkmk/omd
DSTPATH=/omd/sites

podman run -dit -p 8080:5000 -p 8000:8000 --tmpfs $OMDPATH/sites/cmk/tmp,uid=1000,gid=1000  -v $OMDPATH/sites:$DSTPATH:rw --name monitoring -v /etc/localtime:/etc/localtime:ro --restart always checkmk/check-mk-raw:2.1.0p25
