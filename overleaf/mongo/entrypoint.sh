#!/usr/bin/env bash

set -x

if [[ ! -z "$USER_UID" && ! -z "$USER_GID" ]]; then
    groupmod --gid $USER_UID mongodb
    usermod --uid $USER_GID mongodb
fi

chown -R "mongodb:mongodb" "/var/log/mongodb" "/data/configdb" "/data/db"

set +x

exec "/usr/local/bin/docker-entrypoint.sh" "$@"
