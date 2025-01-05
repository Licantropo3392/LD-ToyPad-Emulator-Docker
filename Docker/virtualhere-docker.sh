#!/bin/sh

# Determining which binary file to download
if [ -n "$1" ]; then
  FILENAME="$1"
else
  ARCH=$(uname -m)
  if [ -z "${ARCH##*arm*}" ]; then
    FILENAME="vhusbdarm"
  elif [ "$ARCH" = "mips" ]; then
    FILENAME="vhusbdmips"
  elif [ "$ARCH" = "mipsel" ]; then
    FILENAME="vhusbdmipsel"
  elif [ -z "${ARCH##*x86_64*}" ]; then
    FILENAME="vhusbdx86_64"
  elif [ -z "${ARCH##*aarch64*}" ]; then
    FILENAME="vhusbdarm64"
  else
    FILENAME="vhusbdi386"
  fi
fi

# Downloading and installing the binary
wget https://www.virtualhere.com/sites/default/files/usbserver/$FILENAME
chmod +x $FILENAME
mv $FILENAME /usr/local/sbin/virtualhere
mkdir -p /usr/local/etc/virtualhere
