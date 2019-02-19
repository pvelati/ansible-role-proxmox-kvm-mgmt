#!/usr/bin/env bash

if [ -z "$PROXMOX_USER" ]; then unset PROXMOX_USER; fi
echo "Please enter your Proxmox username: "
read -r PROXMOX_USER_INPUT
export PROXMOX_USER=$PROXMOX_USER_INPUT@pam
if [ -z "$PROXMOX_PASSWORD" ]; then unset PROXMOX_PASSWORD; fi
echo "Please enter your Proxmox password: "
read -sr PROXMOX_PASSWORD_INPUT
export PROXMOX_PASSWORD=$PROXMOX_PASSWORD_INPUT
