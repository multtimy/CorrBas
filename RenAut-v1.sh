#!/bin/bash

V="\e[01;32m"; A="\e[01;33m"; R="\e[01;31m"; B="\e[01;34m"; Z="\e[00m";
function cargando() {
	local n=1
	while [ ${n} -le 7 ]; do
              sleep 0.2
	      echo -e "${A}.\c${Z}"
	      n=$((${n}+1))
	done
	echo ""
}
ext=('.jpeg' '.jpg' '.png' '.gif' '.ico' '.raw' 'tiff' '.tif' '.bmp' '.mp4' '.mkv'
     '.mov' '.avi' '.flv' '.wmv' '.txt' '.sh' '.bat' '.py' '.ry' '.pl' '.json' '.db'
     '.html' '.htm' '.xml' '.css' '.js' '.php' '.cpp' '.dll' '.exe' '.md' '.temp'
     '.tmp' '.chk' '.chck' '.yml' '.lock' '.bin' '.iso' '.jar' '.msi' '.pdf' '.apk'
     '.doc' '.docx' '.csv' '.log' '.bin' '.xls' '.xlsx' '.xlsm' '.pptx' '.ppt'
     '.rtf' '.mdb' '.accdb' '.zip' '.rar' '.7zip' '.tar' '.cpt' '.mp3' '.opus'
     '.wav' '.wma' '.ogg' '.wm' '.webp' '.crypt12' '.crypt1' '.bkup' ' ');
clear
if [ ${#} -eq 1 ]; then
   echo -e "${B}Verificando Existencia Del Directorio${Z}\c";cargando
   if [ -d ${1} ]; then
      echo -e "${B}Verificando Archivos${Z}\c";cargando
      lista=$(ls ${1} 2>/dev/null | wc -l)
      if [ ${lista} -ne 0 ]; then
         echo -en "${A}Ingrese El Nuevo Nombre${R}: ${Z}"; read nuevo
         echo -e "${B}Se Renombraran ${V}${lista} ${B}Archivo${A}(${B}s${A})${Z}"
         echo -e "${V}Iniciando AutoRenombrado${Z}\c";cargando
         nombre=("${nuevo}")
         s=1
         for x in ${ext[@]}; do
             lisext=$(ls ${1}/*${x} 2>/dev/null | wc -l)
             if [ ${lisext} -ne 0 ]; then
                echo -e "\n${A}Renombrando ${V}${lisext} ${A}Archivo${B}(${A}s${B}) ${V}${x}${Z}"
                sleep 0.5
                for y in ${1}/*${x}; do
                     mv -v "${y}" "${1}/${nombre[0]}_$(printf "%02d" ${s})${x}"
                     s=$((${s}+1))
                done
             fi
         done
      else
	echo -e "${R}Verifique Que El Directorio Contenga Archivos Para ${A}AutoRenombrarlos${Z}"
      fi
   else
     echo -e "${R}Error ${A}Verifique Que Exista El Directorio${Z}"
   fi
else
  echo -e "${R}Error ${A}De Parametros ${B}USE${R}:${Z}"
  echo -e "${A} ${0} ${B}'${R}Ruta Del Directorio Con Archivos A ${A}AutoRenombrar${B}'${Z}"
fi
