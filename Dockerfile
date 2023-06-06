FROM debian:testing
#FROM ubuntu:latest
RUN  apt-get update -y


# RUN apt install -y python3-venv
# RUN python3 -m venv /venv
# ENV PATH="/venv/bin:$PATH"


RUN apt install -y cups 
RUN apt install -y sudo
RUN apt install -y cups-client 
RUN apt install -y cups-bsd 
RUN apt install -y cups-filters 
RUN apt install -y foomatic-db-compressed-ppds 
RUN apt install -y printer-driver-all 
RUN apt install -y openprinting-ppds 
RUN apt install -y hpijs-ppds 
RUN apt install -y hp-ppd 
RUN apt install -y hplip 
RUN apt install -y smbclient 
RUN apt install -y printer-driver-cups-pdf 
RUN apt install -y nfs-common
RUN apt install -y mc
RUN apt install -y libreoffice 
RUN apt install -y iputils-ping
RUN apt install -y unoconv 
RUN apt install -y python3-pip
RUN pip install -y --upgrade pip

#-writer

RUN useradd \
  --groups=sudo,lp,lpadmin \
  --create-home \
  --home-dir=/home/print \
  --shell=/bin/bash \
  --password=$(mkpasswd print) \
  print \
&& sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers

COPY . .
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt


# Copy the default configuration file
# Copy the default configuration file
COPY --chown=root:lp cupsd.conf /etc/cups/cupsd.conf
COPY --chown=root:lp /ppd/printers.conf /etc/cups/printers.conf
COPY --chown=root:lp /ppd/ppd/print7.metalab.ifmo.ru.ppd /etc/cups/ppd/print7.metalab.ifmo.ru.ppd
COPY --chown=root:lp /ppd/ppd/print7.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print7.metalab.ifmo.ru.ppd.O
COPY --chown=root:lp /ppd/ppd/print9.metalab.ifmo.ru.ppd /etc/cups/ppd/print9.metalab.ifmo.ru.ppd 
COPY --chown=root:lp /ppd/ppd/print9.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print9.metalab.ifmo.ru.ppd.O 
COPY --chown=root:lp /ppd/ppd/print10.metalab.ifmo.ru.ppd /etc/cups/ppd/print10.metalab.ifmo.ru.ppd
COPY --chown=root:lp /ppd/ppd/print10.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print10.metalab.ifmo.ru.ppd.O 
COPY --chown=root:lp /ppd/ppd/print13.metalab.ifmo.ru.ppd /etc/cups/ppd/print13.metalab.ifmo.ru.ppd 
COPY --chown=root:lp /ppd/ppd/print13.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print13.metalab.ifmo.ru.ppd.O
COPY --chown=root:lp /ppd/ppd/print14.metalab.ifmo.ru.ppd /etc/cups/ppd/print14.metalab.ifmo.ru.ppd
COPY --chown=root:lp /ppd/ppd/print14.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print14.metalab.ifmo.ru.ppd.O
COPY --chown=root:lp /ppd/ppd/print15.metalab.ifmo.ru.ppd /etc/cups/ppd/print15.metalab.ifmo.ru.ppd  
COPY --chown=root:lp /ppd/ppd/print15.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print15.metalab.ifmo.ru.ppd.O 
COPY --chown=root:lp /ppd/ppd/print16.metalab.ifmo.ru.ppd /etc/cups/ppd/print16.metalab.ifmo.ru.ppd  
COPY --chown=root:lp /ppd/ppd/print16.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print16.metalab.ifmo.ru.ppd.O
COPY --chown=root:lp /ppd/ppd/print18.metalab.ifmo.ru.ppd /etc/cups/ppd/print18.metalab.ifmo.ru.ppd 
COPY --chown=root:lp /ppd/ppd/print18.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print18.metalab.ifmo.ru.ppd.O 
COPY --chown=root:lp /ppd/ppd/print19.metalab.ifmo.ru.ppd /etc/cups/ppd/print19.metalab.ifmo.ru.ppd 
COPY --chown=root:lp /ppd/ppd/print19.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print19.metalab.ifmo.ru.ppd.O 
COPY --chown=root:lp /ppd/ppd/print22.metalab.ifmo.ru.ppd /etc/cups/ppd/print22.metalab.ifmo.ru.ppd 
COPY --chown=root:lp /ppd/ppd/print22.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print22.metalab.ifmo.ru.ppd.O 
COPY --chown=root:lp /ppd/ppd/print21.metalab.ifmo.ru.ppd /etc/cups/ppd/print21.metalab.ifmo.ru.ppd 
COPY --chown=root:lp /ppd/ppd/print21.metalab.ifmo.ru.ppd.O /etc/cups/ppd/print21.metalab.ifmo.ru.ppd.O 
COPY --chown=root:lp /ppd/ppd/print2426.metalab.ifmo.ru.ppd /etc/cups/ppd/print2426.metalab.ifmo.ru.ppd

RUN mkdir  /mnt/Scan
RUN mkdir  /mnt/Logs
RUN mkdir  /mnt/File
RUN chmod -R o+w /mnt/


CMD [ "python3", "Main.py"]