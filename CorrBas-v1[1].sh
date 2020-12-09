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
     '.wav' '.wma' '.ogg' '.wm' '.webp' '.crypt12' '.crypt1' '.bkup');
clear
if [ ${#} -eq 1 ]; then
   echo -e "${B}Verificando Directorio${Z}\c";cargando
   if [ -d ${1} ]; then
      conarch=$(ls ${1} 2>/dev/null | wc -l)
      echo -e "${B}Verificando Existencia De Archivos${Z}\c";cargando
      if [ ${conarch} -ne 0 ]; then
         echo -e "${A}Se Corromperan ${V}${conarch} ${A}Archivo${B}(${A}s${B}) ${A}En Total${Z}"
         sleep 0.6
         echo -en "${A}Desea Iniciar El Procceso ${B}[${A}S/n${B}]${R}: ${Z}"; read opcion
         if [ ${opcion} == 's' ] || [ ${opcion} == 'S' ]; then
            echo -e "${B}Iniciando Procceso De Corromper Archivos${Z}\c";cargando
            for x in ${ext[@]}; do
                conext=$(ls ${1}/*${x} 2>/dev/null | wc -l)
                if [ ${conext} -ne 0 ]; then
                   echo -e "${A}Corrompiendo ${V}${conext} ${A}Archivos${B}(${A}s${B}) ${V}${x}${Z}"
                   for y in ${1}/*${x}; do
                       shred -n 7 -fzu ${1}/*${x} 2>/dev/null
                   done
                fi
            done
            consin=$(ls ${1}/* 2>/dev/null | wc -l)
            if [ ${consin} -ne 0 ]; then
               echo -e "${A}Corrompiendo ${V}${consin} ${A}Archivo${B}(${A}s${B}) ${B}Sin Extencion${Z}"
               for z in ${1}/*; do
                   shred -n 7 -fzu ${1}/* 2>/dev/null
               done
            fi
            condir=$(ls ${1}/* 2>/dev/null | wc -l)
            sleep 0.4
            if [ ${condir} -eq 0 ]; then
               echo -e "${V}Procceso Terminado Exitosamente${A}..!${Z}"
            else
              echo -e "${V}Procceso Terminado ${R}Inclompletamente${Z}"
            fi
         elif [ ${opcion} == 'n' ] || [ ${opcion} == 'N' ]; then
              printf ""
         else
           echo -e "${R}Error ${A}Opcion No Valida${Z}"
         fi
      else
        echo -e "${R}NO ${A}Existe Ningun Archivo${R}, ${A}Intentelo Nuevamente${Z}"
      fi
   else
     echo -e "${A}Error ${R}NO ${A}Existe El Directorio${R}, ${A}Intentalo Nuevamente${Z}"
   fi
else
  echo -e "${A}Error De Parametros ${B}USE${R}:${Z}"
  echo -e "${V} ${0} ${B}'${A}Ruta Del Directorio${B}' ${Z}"
fi