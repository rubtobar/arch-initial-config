#!/bin/bash
set -e

REPO_URL="https://github.com/tuusuario/arch-bootstrap.git"
WORKDIR="/tmp/arch-ansible"

echo "[*] Instalando dependencias (git, ansible)..."
sudo pacman -Sy --noconfirm git ansible

echo "[*] Clonando repositorio desde $REPO_URL"
rm -rf "$WORKDIR"
git clone "$REPO_URL" "$WORKDIR"

echo "[*] Ejecutando playbook de Ansible..."
cd "$WORKDIR"
sudo ansible-playbook setup_arch.yml
