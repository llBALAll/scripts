#!/bin/bash

# simples honeypot unicast utilizando netcat;
# netcat escuta em uma porta passada como paramentro e quando o cliente se conecta o netcat envia um banner para simular um real servidor rodando na porta;
# para que o netcat envie o banner do servico para o cliente crie um arquivo (PORTA.TXT) com o conteudo do banner que o servico real envia para o cliente ao estabelecer a conexao na porta;
# uso: ./simplehoneypot.sh PORTA

PORT=$1
DIR="."

while true
do
        echo "" >> $DIR/$PORT.log
        sudo  nc -vnlp $PORT < $DIR/$PORT.txt 1>> $DIR/$PORT.log 2>> $DIR/$PORT.log
        echo $(date) >> $DIR/$PORT.log
done
