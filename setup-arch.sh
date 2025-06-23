#!/bin/bash
set -e

REPO_URL="https://github.com/rubtobar/arch-initial-config.git"
WORKDIR="/tmp/arch-ansible"

echo "[*] Instalando dependencias (git, ansible, sudo)..."
pacman -Sy --noconfirm git ansible sudo openssh

echo "[*] Clonando repositorio desde $REPO_URL"
rm -rf "$WORKDIR"
git clone "$REPO_URL" "$WORKDIR"

echo "[*] Configurando locales"
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
locale-gen

echo "[*] Ejecutando playbook de Ansible..."
cd "$WORKDIR"
LC_ALL=en_US.UTF-8 ansible-playbook setup_arch.yml
