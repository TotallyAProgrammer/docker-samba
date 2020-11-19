FROM ubuntu:20.04

RUN apt update
RUN apt install samba

COPY smb.conf /etc/samba/smb.conf

RUN mkdir -p /samba/public
RUN chown -R nobody:nogroup /samba/public
RUN chmod -R 0777 /samba/public
RUN chgrp sambashare /samba/public

CMD [ "service", "smbd", "restart"]
