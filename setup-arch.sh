#!/bin/bash
set -e

REPO_URL="https://github.com/rubtobar/arch-initial-config.git"
WORKDIR="/tmp/arch-ansible"
LOCALE="en_US.UTF-8"

if [ -z "$1" ]; then
  echo "Uso: $0 nuevo_usuario"
  exit 1
fi

NEW_USERNAME="$1"

echo "[*] Instalando dependencias (git, ansible, sudo)..."
pacman -Sy --noconfirm git ansible sudo openssh

echo "[*] Clonando repositorio desde $REPO_URL"
rm -rf "$WORKDIR"
git clone "$REPO_URL" "$WORKDIR"

echo "[*] Configurando locales"
sed -i "s/^#\s*$LOCALE UTF-8/$LOCALE UTF-8/" /etc/locale.gen
echo "LANG=${LOCALE}" > /etc/locale.conf
locale-gen

echo "[*] Ejecutando playbook de Ansible..."
export LANG=${LOCALE}
export LC_ALL=${LOCALE}
cd "$WORKDIR"
ansible-playbook setup_arch.yml --extra-vars "new_username=${NEW_USERNAME}"
