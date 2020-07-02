#!/bin/bash

declare directorio_backup ficheros
declare fichero_backup respuesta

function copia_seguridad ()
{
  local fichero_log=/tmp/logs/registro-backup.log
  local fich_backup=$1 
  local extension f
  
  shift
  mkdir -p /tmp/logs
  for f in "$@"
  do
    if [ -f $f ]; then
      tar -uf $fich_backup $f 2> /dev/null
      extension=${f##*.}
      if [ "$extension" != "$f" ]; then
        echo $extension >> $fichero_log
      fi
    fi
  done
  if [ -f $fich_backup ]; then
    fich_backup=${fich_backup%.tgz}
    mv $fich_backup.tgz $fich_backup
    gzip -S .tgz $fich_backup 2> /dev/null
  fi
}

if [ $# -ne 1 ]; then
  echo Uso: backup-ficheros2.bash directorio
  exit 1
fi
directorio_backup=$1
if [ ! -d $directorio_backup ]; then
  echo "$directorio_backup no es un directorio"
  exit 2
fi
if [ ! -w $directorio_backup ]; then
  echo "No puedo escribir sobre $directorio_backup"
  exit 3
fi
ls -l /etc | grep '^[l-]' | less
echo -n "Introduzca los ficheros con ruta absoluta: "
read ficheros
fichero_backup=$directorio_backup/$(date +%Y%m%d).tgz
if [ -f $fichero_backup ]; then
  echo -n "El fichero $fichero_backup existe. ¿Desea borrarlo y continuar (s/n)? "
  read respuesta
  if  [ "$respuesta" != "s" -a "$respuesta" != "S" ]; then
    echo Script abortado
    exit 4
  fi
  rm $fich_backup
fi
copia_seguridad $fichero_backup $ficheros
chmod g+r,g-w,o-rw $fichero_backup
chmod go-w $directorio_backup
