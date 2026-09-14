Observações importantes:
*Criar uma pasta com o nome desejado, exemplo: SincPrinter 
*Mover o arquivo dentro dela
*Conceder permissão de execução através do terminal com o comando: sudo chmod +x nomedoarquivo.sh
*Para executar pela priveira vez digitar no terminal: ./caminho/nomedoarquivo.sh  --caso já esteja no diretório basta ./nomedoarquivo.sh
*O script necessita do CUPS instalado para gerir a impressão

#Versâo 1.1#

*Incluída a inicialização automática no código. Defini-la em "Aplicativos Iniciais de Sessão" ou equivalente de sua distribuição
*Todas as alterações anteriores continuam funcionando

#Versâo 1.0#

*Verifica a existência do arquivo 'SINC.OFE.txt' no diretório configurado e o envia automaticamente para impressão através do CUPS
*Algumas proteções simples: verifica variável vazia no nome da impressora; Criação automática do arquivo 'impost'  
*O arquivo 'impost' requer configuração manual do nome da impressora


