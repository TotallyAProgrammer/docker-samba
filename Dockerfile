FROM ubuntu:20.04

LABEL descrption="A some what simple Samba container with complete public access to a shared folder." version="1.0" maintainer="Zane Reick (zane.reick@unknownts.tk)"

RUN apt update -y
RUN apt install samba supervisor -y

RUN rm -f /etc/samba/smb.conf

COPY smb.conf /etc/samba/smb.conf

RUN mkdir -p /samba/public
RUN chown -R nobody:nogroup /samba/public
RUN chmod -R 0777 /samba/public
RUN chgrp sambashare /samba/public

EXPOSE 137
EXPOSE 138
EXPOSE 139
EXPOSE 445


CMD [ "smbd", "--foreground", "--configfile=/etc/samba/smb.conf" ]
