#!/bin/bash

declare directorio_backup ficheros
declare fichero_backup respuesta opcion
declare opcion_d=0 valor_d
declare opcion_f=0 valor_f
declare opcion_v=0
declare opcion_o=0

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
      if [ $opcion_v -eq 1 ]; then
        echo $f
      fi
    fi
  done
  if [ -f $fich_backup ]; then
    fich_backup=${fich_backup%.tgz}
    mv $fich_backup.tgz $fich_backup
    gzip -S .tgz $fich_backup 2> /dev/null
  fi
}

while getopts :d:f:vo opcion
do
  case $opcion in
    d) opcion_d=1
       valor_d=$OPTARG;;
    f) opcion_f=1
       valor_f=$OPTARG;;
    v) opcion_v=1;;
    o) opcion_o=1;;
   \?) echo Opción $OPTARG no válida;;
    :) echo Opción $OPTARG sin valor;;
  esac
done

if [ $opcion_d -eq 0 ]; then
  echo No ha especificado el directorio
  exit 1
fi
directorio_backup=$valor_d
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
if [ $opcion_f -eq 1 ]; then
  fichero_backup=$directorio_backup/$valor_f
else
  fichero_backup=$directorio_backup/$(date +%Y%m%d).tgz
fi
if [ -f $fichero_backup ]; then
  if [ $opcion_o -eq 1 ]; then
    respuesta="s"
  else
    echo -n "El fichero $fichero_backup existe. ¿Desea borrarlo y continuar (s/n)? "
    read respuesta
  fi
  if  [ "$respuesta" != "s" -a "$respuesta" != "S" ]; then
    echo Script abortado
    exit 4
  fi
  rm $fichero_backup
fi
copia_seguridad $fichero_backup $ficheros
chmod g+r,g-w,o-rw $fichero_backup
chmod go-w $directorio_backup
