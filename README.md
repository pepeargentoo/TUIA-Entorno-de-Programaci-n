# TUIA-Entorno-de-Programaci-n
TUIA - Entorno de Programación
# TP_ENTORNO
este repo va a estar el codigo del tp 
### Integrantes:
#### Ponce,Daniel
## ARCHIVO de configuración
###### Debe esta ubicado en la carpeta demo y debe llamarse demo/datos.txt
### Clone el repo
<pre>
git clone [https://github.com/pepeargentoo/TUIA-Entorno-de-Programaci-n](https://github.com/pepeargentoo/TUIA-Entorno-de-Programaci-n.git)
</pre>

### Deploy Local
<pre>
cd TUIA-Entorno-de-Programaci-n
bash main.bash
</pre>
### Deploy DOCKER
<pre>
sudo docker build -t tp_entornos .
sudo docker run -it --rm --name entornos_docker tp_entornos
</pre>
### checked sintaxis
si estas en ubuntu o debian
<pre>
sudo apt install shellcheck
</pre>
Tests:
<pre>
cd TUIA-Entorno-de-Programaci-n
shellcheck src/*
shellcheck main.sh
</pre>
### checked shell online
online:[shellcheck] https://www.shellcheck.net/
