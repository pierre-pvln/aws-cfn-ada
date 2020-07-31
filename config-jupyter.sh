#!/usr/bin/env bash
cd /home/ubuntu
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/CN=ipheion.eu/O=Ipheion/C=NL/ST=Limburg/L=Posterholt' -keyout /home/ubuntu/.ssh/mykey.key -out /home/ubuntu/.ssh/mycert.pem
mkdir /home/ubuntu/.jupyter
cd /home/ubuntu/.jupyter/
echo c.NotebookApp.certfile = u"'/home/ubuntu/.ssh/mycert.pem'" >jupyter_notebook_config.py
echo c.NotebookApp.keyfile = u"'/home/ubuntu/.ssh/mykey.key'" >>jupyter_notebook_config.py
echo c.NotebookApp.ip = "'*'" >>jupyter_notebook_config.py
echo c.NotebookApp.open_browser = False >>jupyter_notebook_config.py
echo c.NotebookApp.port = 8888 >>jupyter_notebook_config.py
