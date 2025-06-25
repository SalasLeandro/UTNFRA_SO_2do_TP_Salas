r/local/bin/

sudo vim Salas_Alta_User-Grupos.sh

***************************************************************
#!/bin/bash

USUARIOPASS=$1
LISTA=$2

ANT_IFS=$IFS
IFS=$'\n'
for LINEA in `cat $LISTA |  grep -v ^#`
do
	                USUARIO=$(echo  $LINEA |awk -F ',' '{print $1}')
			                GRUPO=$(echo  $LINEA |awk -F ',' '{print $2}')
					                HOMEUSER=$(echo  $LINEA | awk -F ',' '{print $3}')
							                "sudo groupadd $GRUPO"
									                "sudo useradd -m -d $HOMEUSER -s /bin/bash -g $GRUPO -p $(sudo grep $USUARIOPASS /etc/shadow |
												                awk -F ':' '{print $2}') $USUARIO"
													done
													IFS=$ANT_IFS
													:wq
													***************************************************************
													ll
													sudo chmod 777 Salas_Alta_User-Grupos.sh
													ll
													./Salas_Alta_User-Grupos.sh \$HOME/
