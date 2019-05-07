##Instalacion y Mantenimiento de una Aplicacion Web
#Importar funciones de otros ficheros



###########################################################
#                  0) DESINSTALAR                         #
###########################################################

function desinstalar(){
	echo "--------------------------------------------------------"
	sudo service apache2 stop
	echo "--------------------------------------------------------"
	sudo apt-get update
	echo "--------------------------------------------------------"
	sudo apt-get purge apache2 apache2-utils apache2-data
	echo "--------------------------------------------------------"
	sudo apt-get purge php libapache2-mod-php
	echo "--------------------------------------------------------"
	sudo apt-get autoremove
	echo "--------------------------------------------------------"
	sudo rm -rf /var/www/html/*
	echo "--------------------------------------------------------"
}
###########################################################
#                  1) INSTALL APACHE                     #
###########################################################
function apacheInstall()
{
	echo "--------------------------------------------------------"
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
	echo "--------------------------------------------------------" 
}

###########################################################
#                  2) Activar el servicio Web Apache      #
###########################################################
function activarApache(){
	echo "--------------------------------------------------------"
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
	#Iniciamos apache
	sudo /etc/init.d/apache2 start
    	echo "Apache esta inicializado"
echo "--------------------------------------------------------"
	echo "Vamos a ver el puerto del que esta escuchando, para ello, vamos a ver si tienes la herramienta necesaria instalada."
	echo "--------------------------------------------------------"
	aux=$(aptitude show net-tools | grep "State: installed")
	aux2=$(aptitude show net-tools | grep "Estado: instalado")
	aux3=$aux$aux2
	if [ -z "aux" ]
	then
		sudo apt-get install net-tools
	else
		echo "Net-tools ya esta instalando"
	fi 
	echo "--------------------------------------------------------"
	echo "¿Por qué puerto escucha apache?"
	sudo netstat -anp | grep apache2
	echo "--------------------------------------------------------"
	echo "Vamos a abrir firefox con tu localhost"
	firefox http://127.0.0.1 & 
	echo "--------------------------------------------------------"
	sleep 1
}

###########################################################
#                  3) Instalar el módulo PHP              #
###########################################################
function instalarPHP()
{
	echo "--------------------------------------------------------"	
	aux=$(aptitude show php | grep "Estado: instalado")
	aux2=$(aptitude show libapache2-mod-php | grep "Estado: instalado")
	if [ -z "$aux" ]
	then 
 	  echo -e "Instalando paquete PHP ...\n"
 	  sudo apt install php
	else
   	  echo -e "El paquete PHP ya estaba instalado\n"
 	fi
    	echo "--------------------------------------------------------"
	if [ -z "$aux2" ]
	then
	  echo -e "Instalando paquete libapache2-mod-php ...\n"
	  sudo apt install libapache2-mod-php
	else
	  echo -e "El paquete libapache2-mod-php ya estaba instalado\n"
	fi 
	echo "--------------------------------------------------------"
}

###########################################################
#                  4) Testear el módulo PHP               #
###########################################################
function testPHP()
{
		echo "--------------------------------------------------------"
		echo "hello hello"
	    	echo "Testeando PHP..."
		echo "--------------------------------------------------------"
		sudo touch /tmp/test.php
		echo "<?php phpinfo(); ?>" >> /tmp/test.php 
		echo "--------------------------------------------------------"
		sudo mv /tmp/test.php /var/www/html/test.php
		echo "--------------------------------------------------------"
		sudo chmod 644 /var/www/html/test.php
		echo "--------------------------------------------------------"
		firefox 127.0.0.1/test.php
		echo "--------------------------------------------------------"
}

###########################################################
#            5) Crear un entorno virtual para Python3     #
###########################################################
function crearEntornoPython(){
aux=$(aptitude show virtualenv | grep "State: installed")
aux2=$(aptitude show virtualenv | grep "Estado: instalado")
aux3=$aux$aux2
	echo "--------------------------------------------------------"
	if [ -z "$aux3" ]
	then 
	  echo "instalando ..."
 	  sudo apt-get install virtualenv
	else
   	  echo "virtualenv ya estaba instalado"
    	  sleep 2
	fi 
	echo "--------------------------------------------------------"
	if [ -z "python3envmetrix" ] 
	#si existe la carpeta devuelve true y sino false
	then 
	  echo "La carpeta ya esta creada"
	  sleep 3
	else
          virtualenv python3envmetrix
	  sleep 5
	fi
	echo "--------------------------------------------------------"
}

###########################################################
#          6) Instalar los paquetes necesarios            #
###########################################################
function instalarPaquetes(){
	aux=$(aptitude show python3-pip | grep "State: installed")
	aux2=$(aptitude show python3-pip| grep "Estado: instalado")
	aux3=$aux$aux2
	if [ -z "$aux3" ]
	then 	
		echo "--------------------------------------------------------"
		echo "Vamos a instalar el pip de python 3"
		sudo apt-get install python3-pip
		echo "--------------------------------------------------------"
		echo "Instalado"
		echo "--------------------------------------------------------"
	else
		echo "--------------------------------------------------------"
		echo "python 3 pip ya estaba instalado"
		echo "--------------------------------------------------------"
	fi
	aux=$(aptitude show dos2unix | grep "State: installed")
	aux2=$(aptitude show dos2unix | grep "Estado: instalado")
	aux3=$aux$aux2
	if [ -z "$aux3" ]
	then 	
		echo "--------------------------------------------------------"
		echo "Vamos a instalar dos2unix"
		sudo apt-get install dos2unix
		echo "--------------------------------------------------------"
		echo "Instalado"
		echo "--------------------------------------------------------"
	else
		echo "--------------------------------------------------------"
		echo "dos2unix ya estaba instalado"
		echo "--------------------------------------------------------"
	fi
	aux4=$(crearEntornoPython| grep "Antes de seguir necesitamos tener el entorno python instalado")
	aux3=$aux$aux2
	if [ -z "$aux3" ]
	then 
		echo "--------------------------------------------------------"
		echo "Instalado"
		echo "--------------------------------------------------------"	
		crearEntornoPython
	else
		echo "--------------------------------------------------------"
		echo "el entorno python ya estaba instalado"
		echo "--------------------------------------------------------"
	fi
	cd python3envmetrix/bin/ 
	source activate
	aux=$(aptitude show python-numpy | grep "State: installed")
	aux2=$(aptitude show python-numpy | grep "Estado: instalado")
	if [ -z "$aux3" ]
	aux3=$aux$aux2
	then 	
		echo "--------------------------------------------------------"
		echo "Vamos a instalar python-numpy"
		sudo apt-get install python-numpy
		echo "--------------------------------------------------------"
		echo "Instalado"
		echo "--------------------------------------------------------"
	else
		echo "--------------------------------------------------------"
		echo "python-numpy ya estaba instalado"
		echo "--------------------------------------------------------"
	fi
	aux=$(aptitude show nltk | grep "State: installed")
	aux2=$(aptitude show nltk | grep "Estado: instalado")
	aux3=$aux$aux2
	if [ -z "$aux3" ]
	then 	
		echo "--------------------------------------------------------"
		echo "Vamos a instalar -U nltk"
		sudo pip3 install -U nltk
		echo "--------------------------------------------------------"
		echo "Instalado"
		echo "--------------------------------------------------------"
	else
		echo "--------------------------------------------------------"
		echo "-U nltk ya estaba instalado"
		echo "--------------------------------------------------------"
	fi
	aux=$(aptitude show python-argparse | grep "State: installed")
	aux2=$(aptitude show python-argparse| grep "Estado: instalado")
	aux3=$aux$aux2
	if [ -z "$aux3" ]
	then 	
		echo "--------------------------------------------------------"
		echo "Vamos a instalar -y python-argparse"
		sudo apt-get install -y python-argparse
		echo "--------------------------------------------------------"
		echo "Instalado"
		echo "--------------------------------------------------------"
	else
		echo "--------------------------------------------------------"
		echo "-y python-argparse ya estaba instalado"
		echo "--------------------------------------------------------"
	fi
	#cd python3envmetrix/bin/ 
	deactivate
#Hay que iniciar el entorno virtual para instalar todo esto de abajo
#sudo apt install python-numpy 
#o
#sudo pip3 install numpy
#sudo pip3 install -U nltk
#sudo apt-get install -y python-argparse
# desactivar el entorno python
}

###########################################################
#                  7) Probar aplicación                   #
###########################################################
function probarAplicacion()
{
	echo "--------------------------------------------------------"
	cd
	cd proyecto/ISO/fich/
        source python3envmetrix/bin/activate
        python3 complejidadtextual.py textos/english.doc.txt
        deactivate
	echo "--------------------------------------------------------"
}

###########################################################
#                  8) Instalar aplicación                 #
###########################################################
function instalarAplicacion(){
	sudo cp index.php webprocess.sh complejidadtextual.py textos/english.doc.txt /var/www/html
	sudo cp -R python3envmetrix /var/www/html
	sudo chmod -R 777 /var/www/html
	sudo cd /var/www/html
	./webprocess.sh   textos/english.doc.txt
	
}

###########################################################
#                  9) Abrir con Firefox                   #
###########################################################
function abrirFirefox(){
	echo "--------------------------------------------------------"
	sudo mv /tmp/index.php /var/www/html/index.php
	echo "--------------------------------------------------------"
	echo "Abriendo la Aplicación desde Firefox"
	echo "--------------------------------------------------------"
	firefox http://localhost/index.php &
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
	cd /var/log/
	comprimidos="/tmp/aux.txt"
	archivos="/tmp/aux2.txt"
	ver=ls auth.log*.gz
	zcat $ver > $comprimidos
	cat /var/log/auth.log /var/log/auth.log.1 > $archivos
	echo -e "Los ficheros con los que estamos trabajando son $archivos $comprimidos "
	cat $archivos $comprimidos | grep sshd| grep "Failed password" | tr -s " "| tr " " "0"> /tmp/logfailtratados.txt
	echo -e "Los intentos de conexion ssh en formato dd/mm/yyyy "
	for linea in less /tmp/logfailtratados.txt
		do 
		usuarios=$(echo $linea | cut -f9 -d "0")
		fecha=$(echo $linea | cut -f1 -3 -d "0")
		echo -e "Status [fail] nombre: $usuario fecha:" echo $fecha|tr "0" ""
	done 
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
#sudo apt-get update
#sudo apt-get upgrade
echo -e "\n"
while test $opcionmenuppal -ne 12
do
	#Muestra el menu
	echo -e "0 Desinstalar todo \n"
	echo -e "1 Instala Apache \n"
	echo -e "2 Activar Apache \n"
	echo -e "3 Instala PHP \n"
	echo -e "4 Probar PHP \n"
	echo -e "5 Crear entorno virtual para Python3 \n"
	echo -e "6 Instala paquetes necesarios \n"
	echo -e "7 Probar aplicación \n"
	echo -e "8 Instalar aplicación \n"
	echo -e "9 abrir aplicación con Firefox \n"
	echo -e "10 Ver logs \n"
	echo -e "11 Controlar intentos de conexión de ssh \n"
	echo -e "12 Salir \n"
	read -p "Elige una opcion:" opcionmenuppal
	case $opcionmenuppal in
			0) desinstalar;;
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
