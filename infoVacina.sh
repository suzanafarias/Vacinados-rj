#!/usr/bin/env bash

# author: Suzana Farias <suzana.farias@e-core.com>
# describe: Get data from vacinometro

# titulo: grep '<title>' vacinometro.html | sed 's/<[^>]*>//g'
# porcentagem de imunizados com mais de 12 anos: grep '<h4 class="text-porcentagem-imunizados porcentagem-imunizados">' vacinometro.html | sed 's/<[^>]*>//g'
# ===================================================

function infoVacina(){
	local _site=$(mktemp)
	
	wget "$1" -O "$_site" 2>/dev/null
	
	local _title=$(grep '<title>' $_site | sed 's/<[^>]*>//g')
	local _porcentagemDeVacinados=$(grep '<h4 class="text-porcentagem-imunizados porcentagem-imunizados">' $_site | sed 's/<[^>]*>//g')
	
	echo Site:  $_title
	echo Porcentagem de Vacinados: $_porcentagemDeVacinados

}
infoVacina "$1"
