#!/bin/bash

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Función para manejar la interrupción
function ctrl_c() {
  echo -e "${redColour}\nCancelando...${endColour}"
  echo "${redColour}Exit${endColour}"
  exit
}

# Manejar la interrupción SIGINT
trap ctrl_c INT

# Verificar si se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
  echo -e "${redColour}Este script debe ser ejecutado como root.${endColour}"
  exit 1
fi

# Verificar conexión a Internet
if ! ping -c 1 google.com >/dev/null 2>&1; then
  echo -e "${redColour}No hay conexión a Internet. El script se detendrá aquí.${endColour}"
  exit 1
fi

# Lista de dependencias requeridas
dependencias=("curl" "default-jdk" "wget")

# Verificar e instalar dependencias faltantes
for dependencia in "${dependencias[@]}"; do
  if ! dpkg -s "$dependencia" >/dev/null 2>&1; then
    echo -e "${yellowColour}Instalando dependencia: $dependencia${endColour}"
    apt install "$dependencia" -y
  fi
done

# Descargar y configurar apktool
echo -e "${blueColour}Descargando apktool...${endColour}"
curl -sL "https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool" -o /usr/local/bin/apktool
chmod +x /usr/local/bin/apktool

# Descargar apktool.jar
echo -e "${blueColour}Descargando apktool.jar...${endColour}"
wget -q "https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.7.0.jar" -O /usr/local/bin/apktool.jar
chmod +x /usr/local/bin/apktool.jar

echo -e "\n${greenColour}Instalación completada correctamente.${endColour}"
echo -e "${purpleColour}Versión de apktool:${endColour}"
apktool --version

exit
