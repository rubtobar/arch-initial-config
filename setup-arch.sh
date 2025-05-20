#!/bin/bash
set -e

REPO_URL="git@github.com:rubtobar/arch-initial-config.git"
WORKDIR="/tmp/arch-ansible"

echo "[*] Instalando dependencias (git, ansible, sudo)..."
pacman -Sy --noconfirm git ansible sudo openssh

echo "[*] Clonando repositorio desde $REPO_URL"
rm -rf "$WORKDIR"
git clone "$REPO_URL" "$WORKDIR"

echo "[*] Ejecutando playbook de Ansible..."
cd "$WORKDIR"
ansible-playbook setup_arch.yml
