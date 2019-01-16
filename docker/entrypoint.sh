#!/bin/sh -e

if [ ! -e '/etc/ssh/*.pub' ]; then
  mkdir -p /etc/ssh/
  ssh-keygen -N '' -t rsa -b 4096 -f /var/ssh/host_keys/rsa
  ssh-keygen -N '' -t ecdsa -f /var/ssh/host_keys/ecdsa
  ssh-keygen -N '' -t ed25519 -f /var/ssh/host_keys/ed25519
  chmod -R 0400 /var/ssh/host_keys/*
fi
if [ ! -e '/home/proxy/.ssh/authorized_keys' ]; then
  wget -O /home/proxy/.ssh/authorized_keys http://github.com/${USER_NAME}.keys
  chmod 0400 /home/proxy/.ssh/authorized_keys
fi

/usr/sbin/sshd -D
