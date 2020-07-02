#!/bin/bash

declare directorio_backup ficheros
declare fichero_backup

function copia_seguridad () 
{
  local fichero_log=/tmp/logs/registro-backup.log

  mkdir -p /tmp/logs
  tar -czvf "$@" >| $fichero_log 2> /dev/null
}

directorio_backup=$1
ls -l /etc | grep '^[l-]' | less
echo -n "Introduzca los ficheros con ruta absoluta: "
read ficheros
fichero_backup=$directorio_backup/$(date +%Y%m%d).tgz
rm -f $fichero_backup
copia_seguridad $fichero_backup $ficheros
chmod g+r,g-w,o-rw $fichero_backup
chmod go-w $directorio_backup
