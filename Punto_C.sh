

cd UTN-FRA_SO_Examenes/
ll
cd 202406/
ll
cd docker/

cat docker-compose.yml           << no lo tengo
genero token TP2
read Write delete
sudo vim index.html

||||||||||||||NO ME DEJA ESCRIBIR CORRECTAMENTE SOBRE EL ARCHIVO||||||||||||||||
<div>
        <h1> Sistemas Operativos - UTNFRA </h1><br>
        <h2> 2do Parcial - Junio 2024 </h2> </br>
        <h3> Leandro Salas</h3>
        <h3> División: 116</h3>
</div>

docker login -u leandrosalas
password:
dckr_patxxxxxx_xuvsdsd46uyqIRe9WsmohQ7Io93vJgMxxxxxxxxxxxxxxxxxxx

sudo vim dockerfile
FROM nginx
COPY . /usr/share/nginx/html

docker build -t leandrosalas/web1-salas:latest .
docker run -d -p 8080:80 leandrosalas/web1-salas
sudo vim run.sh -d
