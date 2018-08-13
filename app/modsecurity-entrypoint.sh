#!/bin/bash

set -u 

if [[ -z $MODSEC_MOD  ]] 
    then 
    echo "ModSecurity DectectionOnly Activated" 

    elif [[ $MODSEC_MOD == "On" ]] 
    then
    exec sed 's/SecRuleEngine DetectionOnly/SecRuleEngine On/g' /etc/nginx/modsec/modsecurity.conf 
	echo "ModSecurity Active Response Acivated"

    elif [[ $MODSEC_MOD == "Off" ]] 
    then
    exec sed 's/SecRuleEngine DetectionOnly/SecRuleEngine Off/g' /etc/nginx/modsec/modsecurity.conf 
	echo "ModSecurity Deactivated"

    else 
	    echo "Wrong Option Nothing to Do"
fi
