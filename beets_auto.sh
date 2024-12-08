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

source $BEETS_ENV
if pgrep -x "beet" > /dev/null
then
    echo "Running"
else
    echo "Stopped"
    source $BEETS_ENV
    beet import "${BASE}"
fi