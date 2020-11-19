FROM ubuntu:20.04

LABEL descrption="A some what simple Samba container with complete public access to a shared folder." version="1.0" maintainer="Zane Reick (zane.reick@unknownts.tk)"

RUN apt update -y
RUN apt install samba samba-common supervisor -y

#RUN rm -f /etc/samba/smb.conf

RUN mkdir /config

COPY *.conf /config/

RUN mkdir -p /samba/public
RUN chown -R nobody:nogroup /samba/public
RUN chmod -R 0777 /samba/public
RUN chgrp sambashare /samba/public

EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp

VOLUME [ "/samba/public" ]


#CMD [ "smbd", "--foreground", "--configfile=/etc/samba/smb.conf" ]
ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]