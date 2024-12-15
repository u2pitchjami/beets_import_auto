#!/bin/bash
############################################################################## 
#                                                                            #
#	SHELL: !/bin/bash       version 1.1                                      #
#									                                         #
#	NOM: u2pitchjami						                                 #
#									                                         #
#	            							                                 #
#									                                         #
#	DATE: 08/12/2024	           				                             #
#								                                    	     #
#	BUT: auto import beets avec restart                                       #
#									                                         #
############################################################################## 
SCRIPT_DIR=$(dirname "$(realpath "$0")")
source ${SCRIPT_DIR}/.config.cfg

if [ ! -d $DOSLOG ]
	then
	mkdir $DOSLOG
fi

if [ -f $CONFIG_NORMAL ]; then
    mv "${CONFIG}" "${CONFIG_MANUEL}"
    mv "${CONFIG_NORMAL}" "${CONFIG}"
fi
echo -e "[`date`] - Démarrage du script import auto beets :" | tee -a $LOG
source $BEETS_ENV
if pgrep -x "beet" > /dev/null
then
    echo "beets Running" | tee -a $LOG
else
    echo "beets Stopped" | tee -a $LOG
    echo "restart beets" | tee -a $LOG
    source $BEETS_ENV
    beet import "${BASE}"
fi