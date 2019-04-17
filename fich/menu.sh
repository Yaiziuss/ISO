##Instalacion y Mantenimiento de una Aplicacion Web
#Importar funciones de otros ficheros

###########################################################
#                  1) INSTALL APACHE                     #
###########################################################
function apacheInstall()
{
	aux=$(aptitude show apache2 | grep "State: installed")
	aux2=$(aptitude show apache2 | grep "Estado: instalado")
	aux3=$aux$aux2
	if [ -z "$aux3" ]
	then 
 	  echo "instalando ..."
 	  sudo apt-get install apache2
	else
   	  echo "apache ya estaba instalado"
    
	fi 
}

###########################################################
#                  2) Activar el servicio Web Apache      #
###########################################################
function activarApache()
{
	echo u
}

###########################################################
#                  3) Instalar el módulo PHP              #
###########################################################
function instalarPHP()
{
	aux=$(aptitude show php | grep "Estado: instalado")
	aux2=$(aptitude show libapache2-mod-php | grep "Estado: instalado")
	if [ -z "$aux" ]
	then 
 	  echo -e "Instalando paquete PHP ...\n"
 	  sudo apt install php
	else
   	  echo -e "El paquete PHP ya estaba instalado\n"
 	fi
    
	if [ -z "$aux2" ]
	then
	  echo -e "Instalando paquete libapache2-mod-php ...\n"
	  sudo apt install libapache2-mod-php
	else
	  echo -e "El paquete libapache2-mod-php ya estaba instalado\n"
	fi 
}

###########################################################
#                  4) Testear el módulo PHP               #
###########################################################
function testPHP()
{
	echo u
}

###########################################################
#            5) Crear un entorno virtual para Python3     #
###########################################################
function crearEntornoPython()
{
	echo u
}

###########################################################
#          6) Instalar los paquetes necesarios            #
###########################################################
function instalarPaquetes()
{
	echo u
}

###########################################################
#                  7) Probar aplicación                   #
###########################################################
function probarAplicacion()
{
	echo u
}

###########################################################
#                  8) Instalar aplicación                 #
###########################################################
function instalarAplicacion()
{
	echo u
}

###########################################################
#                  9) Abrir con Firefox                   #
###########################################################
function abrirFirefox()
{
	echo u
}

###########################################################
#                        10) Ver logs                     #
###########################################################
function verLogs()
{
	echo u
}

###########################################################
#          11) Controlar intentos de conexión             #
###########################################################
function controlarConexion()
{
	echo u
}

###########################################################
#                     12) SALIR                          #
###########################################################

function fin()
{
	echo -e "¿Quieres salir del programa?(S/N)\n"
        read respuesta
	if [ $respuesta == "N" ] 
		then
			opcionmenuppal=0
		fi	
}

### Main ###
opcionmenuppal=0
while test $opcionmenuppal -ne 12
do
	#Muestra el menu
	echo -e "1 Instala Apache \n"
	echo -e "2 Activar Apache \n"
	echo -e "3 Instala PHP \n"
	echo -e "4 Probar PHP \n"
	echo -e "5 Crear entorno virtual para Python3 \n"
	echo -e "6 Instala paquetes necesarios \n"
	echo -e "7 Probar aplicación \n"
	echo -e "8 Instalar aplicación \n"
	echo -e "9 abrir plicación con Firefox \n"
	echo -e "10 Ver logs \n"
	echo -e "11 Controlar intentos de conexión de ssh \n"
	echo -e "12 Salir \n"
	read -p "Elige una opcion:" opcionmenuppal
	case $opcionmenuppal in
			1) apacheInstall;;
			2) activarApache;;
			3) instalarPHP;;
			4) testPHP;;
			5) crearEntornoPython;;
			6) instalarPaquetes;;
			7) probarAplicacion;;
			8) instalarAplicacion;;
			9) abrirFirefox;;
			10) verLogs;;
			11) controlarConexion;;
			12) fin;;
			*) ;;

	esac 
done 

echo "Fin del Programa" 
exit 0 
