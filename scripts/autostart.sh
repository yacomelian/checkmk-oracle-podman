#!/bin/bash

SYSTEMD=$HOME/.config/systemd/user/

podman generate systemd --new --name monitoring -f

mkdir -p $SYSTEMD
mv -v container-monitoring.service $SYSTEMD

systemctl --user daemon-reload
systemctl --user enable container-monitoring


#echo Comprueba estado:
systemctl --user status container-monitoring

echo Ahora como root, ejecuta
echo loginctl enable-linger $USER
