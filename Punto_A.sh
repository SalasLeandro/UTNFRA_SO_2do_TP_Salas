

sudo fdisk -l   	<< ver donde estan los discos
sudo fdisk /dev/sdc      << entros en la parte de particionamiento
n     
p	primary
1     particion numero 1
enter
LE ASIGNO ESPACIO  +1.5G

t para cambiar el tipo tiene que ser tipo LVM Para poder trabajarla
8e 		hexadecimal
los volumenes que van a parar a lvm son volumenes logicos

n 	nueva particion
p	primaria tmb
particion numero 2
t 	cambias el tipo
lvm      tipo de particion

p       muestra discos
wq   	guardas y salis

------------------
voy al disco numero 2

sudo fdisk /dev/sdd
n
p
particion numero 1
t cambias el tipo
8e    tipo de particion lvm
---------------------------
generar volumen fisico
convertirlas sdc1 y sdc2
convertirlas sdd1

sudo pvs

              nombre del volumen
sudo vgcreate vg_datos /dev/sdc1 /dev/sdd1
sudo vgcreate vg_temp /dev/sdc2

sudo vgs    << listas todos los volumenes

sudo lvcreate -L +5M vg_datos -n lv_docker

sudo lvs     <<<<<< ves como te quedo creado ese volumen logico

sudo lvcreate -L +1.5G vg_datos -n lv_workareas

para ocupar el porcentaje vacio si es necesario va ese 100%free
sudo lvcreate -l +100%FREE vg_temp -n lv_swap
sudo lvcreate -L +512M vg_temp -n lv_swap

---------------------------------------------
DESPUES DE TODO ESO DARLE UN FORMATO
SE FORMATEAN
puede ser el formato con .ext1 .ext2 .ext3 .ext4
sudo fdisk -l      <<<listas discos
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas

el de SWAP SE FORMATEA DE MANERA DISTINTA
sudo mkswap /dev/mapper/vg_temp-lv_swap
----------------------------------------------
Ahora los montas
el de memoria swap no se monta se habilita
sudo swapon /dev/mapper/vg_temp-lv_swap

free -h           << ver si se habilito

cuando instalas docker se crea un punto de montaje
entonces te fijas si tenes esta carpeta /var/lib/docker que se crea cuando tenes
instalado docker
cd /var/lib/
ll       << te lista, tengo docker

cd /
ls 
Me voy a raiz y veo si tengo el montaje de la tabla /work/
sudo mkdir work
ls
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/
sudo mount /dev/mapper/vg_datos-lv_workareas /work/

df -h     <<< ver si quedaron montados

Memoria Swap ya la habilite antés

Ahora desconecto el docker 
sudo systemctl restart docker
sudo systemctl status docker
