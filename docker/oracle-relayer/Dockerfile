FROM ubuntu:20.04

ADD bin/ /usr/bin/
ADD run.sh /run.sh

WORKDIR /data/

ADD config.json .

ENTRYPOINT [ "/run.sh" ]