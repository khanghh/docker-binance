FROM ubuntu:20.04

ADD bin/ /usr/bin/
ADD run.sh /run.sh
ADD data/ /data/

WORKDIR /data/

ENTRYPOINT [ "/run.sh" ]