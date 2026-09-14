## Observações importantes

- Criar uma pasta com o nome desejado em qualquer diretório. Exemplo: `SincPrinter`.
- Mover o arquivo para dentro dela.
* Conceder permissão de execução através do terminal com o comando: 
###### sudo chmod +x nomedoarquivo.sh 

- Para executar pela primeira vez, digitar no terminal: 
###### ./caminho/nomedoarquivo.sh 

- Caso já esteja no diretório do arquivo, basta executar:
###### ./nomedoarquivo.sh 

- O script necessita do CUPS instalado e configurado para gerenciar a impressão.



## Notas de versão ##

- Versão 1.1.1
* Pequena correção de sintaxe.
* Todas as alterações anteriores continuam funcionando.
- Versão 1.1
* Incluída a inicialização automática no código. Defini-la em "Aplicativos Iniciais de Sessão" ou equivalente de sua distribuição.
* Todas as alterações anteriores continuam funcionando.
- Versão 1.0
* Verifica a existência do arquivo SINC.OFE.txt no diretório configurado e o envia automaticamente para impressão através do CUPS.
- Algumas proteções simples:
* Verifica variável vazia no nome da impressora.
* Criação automática do arquivo impost.
* O arquivo impost requer configuração manual do nome da impressora.
