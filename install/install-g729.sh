#!/bin/bash
source funcoes.sh
BRANCH='devel'

# Checar asterisk

	if [ ! -d "/etc/asterisk" ]; then
		
		func_install_g729
		bash install-asterisk.sh
                ExitFinish=1

		
	else
		func_install_asterisk
		func_install_g729
		bash install-asterisk.sh
                ExitFinish=1

	fi
		
		
# Fim seta CPU


