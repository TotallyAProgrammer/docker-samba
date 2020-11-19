FROM ubuntu:20.04

RUN apt update -y
RUN apt install samba -y

COPY smb.conf /etc/samba/smb.conf

RUN mkdir -p /samba/public
RUN chown -R nobody:nogroup /samba/public
RUN chmod -R 0777 /samba/public
RUN chgrp sambashare /samba/public

EXPOSE 137
EXPOSE 138
EXPOSE 139
EXPOSE 445


CMD [ "service", "smbd", "restart"]
