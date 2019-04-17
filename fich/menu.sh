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
	
}

###########################################################
#                  3) Instalar el módulo PHP              #
###########################################################
function instalarPHP()
{
	aux=$(aptitude show php | grep "State: installed")
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
#                  4) Testear el módulo PHP               #
###########################################################
function testPHP()
{
	 
}

###########################################################
#            5) Crear un entorno virtual para Python3     #
###########################################################
function crearEntornoPython()
{
	
}

###########################################################
#          6) Instalar los paquetes necesarios            #
###########################################################
function instalarPaquetes()
{
	
}

###########################################################
#                  7) Probar aplicación                   #
###########################################################
function probarAplicacion()
{
	
}

###########################################################
#                  8) Instalar aplicación                 #
###########################################################
function instalarAplicacion()
{
	
}

###########################################################
#                  9) Abrir con Firefox                   #
###########################################################
function abrirFirefox()
{
	
}

###########################################################
#                        10) Ver logs                     #
###########################################################
function verLogs()
{
	
}

###########################################################
#          11) Controlar intentos de conexión             #
###########################################################
function controlarConexion()
{
	
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
