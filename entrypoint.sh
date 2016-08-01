#!/bin/bash

unset GOSU
[ -z "$USER_ID" ] && {
  echo "Must set User to run as. Try adding"
  echo '-e USER_ID=$(id -u)'
  exit 1
}
USER=user
useradd --shell /bin/bash -u $USER_ID -o -c "" -m $USER
export HOME=/home/$USER
exec /usr/local/bin/gosu $USER "$@"
