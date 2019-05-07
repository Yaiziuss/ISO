#!/bin/bash
DIRVIRTPYTHON='/var/www/html/python3envmetrix'
source $DIRVIRTPYTHON/bin/activate
cd /var/www/html
python3 ./complejidadtextual.py $1
deactivate


