#!/bin/bash

####### Verificação da instalação do CUPS, especialmente o comando 'lp ####### '
	which lp > /dev/null #procura o diretório do comando 'lp', recebe o código em '$?' e redireciona a saída para não ser impressa na tela      
	if [ $? -ne 0 ]; then #condicional para verificar se a saída de '$?' obteve êxito 0 ou 1
       	echo "CUPS não instalado! Instale-o, configure-o e execute novamente" #auxilio para configurar o CUPS
		echo "Abra o navegador e vá a localhost:631 para configurá-lo" #auxilio para configurar o CUPS
		echo "Seu nome de usuário para login: $(whoami)" #auxilio para configurar o CUPS whoami imprime o nome do usuario
        echo "Senha é a mesma de login do usuário do PC" #auxilio para configurar o CUPS
        exit 1 #encerra o script caso não encontre o CUPS, comando 'lp'  
        else 
		echo "Comando lp do CUPS encontrado" #auxilio para configurar o CUPS
		echo "Abra o navegador e vá a localhost:631 para configurá-lo caso necessário" #auxilio para configurar o CUPS
        echo "Seu nome de usuário para login: $(whoami)" #auxilio para configurar o CUPS whoami imprime o nome do usuario
		echo "Senha é a mesma de login do usuário do PC" #auxilio para configurar o CUPS
								echo '' # quebra de linha
	fi
####### Fim da verificação da instalação do CUPS, comando 'lp' #######
	
####### Variáveis importantes para a inicialização automática NÃO MODIFICAR #######
dirSincPrinter="$(dirname "$0")" #$0 contém o caminho do script, dirname mantém apenas o diretório dele
impost="$dirSincPrinter/impost" #define que o arquivo impost está na mesma pasta do SincPrinter. 

####### Verificação do arquivo "impost" necessário para rodar o script #######
####### "Impressora" e "caminhoDownload" variáveis carregadas do arquivo "impost" ####### 
	if [ -f "impost" ]; then
			echo "Arquivo 'impost' encontrado" #apenas para controle em execucao via terminal
	else
 	        echo "Arquivo 'impost' não encontrado. Criando..." #apenas para controle em execucao via terminal
			echo "caminhoDownload=$HOME/Downloads" > impost #texto de configuracao do caminho do arquivo SINC.OFE.txt + criacao do arquivo
			echo 'impressora=""' >> impost #texto de configuracao do nome da impressora
		                		echo '' >> impost; echo '' >> impost #quebra de linha *2
			echo '#Caso contenham espaços ou acentos nos nomes colocar os valores entre aspas' >> impost #explicação possível erro
			echo '#Exemplo: caminhoDownload="/home/dante/Downloads"' >> impost #explicação possível erro
			echo '#Exemplo: impressora="Argox OS 214"' >> impost #explicação possível erro
								echo ''>> impost # quebra de linha
            echo '#Criado por: Dante Giordano' >> impost #creditos
			echo "Arquivo 'impost' criado com sucesso" #apenas para controle em execução via terminal
								echo '' # quebra de linha
			echo "Preencha o nome da impressora no arquivo 'impost' e execute novamente"
			echo "Impressoras disponíveis: $(lpstat -v)" #lista as impressoras detectadas para auxiliar
			exit 0
	fi 

####### Fim da verificação da existência do arquivo "impost" #######

####### Variáveis e listagem 'echo' das configurações 'impost'#######
source "$impost" #executa o arquivo impost NÃO MODIFICAR
sincofe="$caminhoDownload/SINC.OFE.txt" #NÃO MODIFICAR
echo "Caminho definido: $sincofe" #apenas para controle em execução via terminal
echo "Impressora definida: $impressora" #apenas para controle em execução via terminal

#Funções
controllo () {
####### Função responsável por verificar a existência do arquivo 'SINC.OFE.txt' no diretório escoliho em 'impost' e enviá-lo para impressão #######


	if [ -f "$sincofe" ] # caso exista o arquivo "SINC.OFE.txt" no diretório configurado no arquivo "impost"
	then
			echo "Arquivo encontrado" #apenas para controle em execução via terminal 
	if lp -d "$impressora" -o raw "$sincofe" #envia o arquivo SINC.OFE.txt para a impressora configurada como "cru" e aguarda êxito
	then
			rm -f "$sincofe"; fi  # ao ter sucesso apaga o arquivo "SINC.OFE.txt" e finaliza o if interno
	fi
}
####### Fim das Funções #######

####### Verifica se o usuário atribuiu algum valor para a impressora no 'impost' #######
	if [ "$impressora" = "" ]; then #verifica se a variavel está vazia
 			echo "Favor configurar o nome da impressora e executar o script novamente" 
			exit 1 #encerra o script enquanto não possuir texto atribuído
	fi

####### Loop de execução da função controllo #######
	while true 
	do
		controllo
		sleep 0.5
	done

#Criado por Dante Giordano
