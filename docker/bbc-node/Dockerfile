FROM ubuntu:20.04

ADD bin/ /usr/bin/
ADD run.sh /run.sh
ADD keys/ /keys/

WORKDIR /root/

ADD data/ /root/

ENTRYPOINT [ "/run.sh" ]