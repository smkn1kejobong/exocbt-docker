FROM ubuntu:20.04
LABEL maintainer="itnsapurbalingga"
LABEL version="4.3.0"
LABEL description="ExtraOrdinaryCBT v4.3.0 (Docker) [Unofficial]"
USER root
WORKDIR "/app"
RUN apt update && \
    apt install -y tzdata wget nano unzip
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN wget https://s3.ekstraordinary.com/extraordinarycbt/release-rosetta/4.3.0-rosetta-ubuntu+2.zip -O exocbt.zip
RUN unzip exocbt.zip
RUN cp -R 4.3.0-rosetta-ubuntu+2/* .
RUN rm exocbt.zip
RUN rm -rf 4.3.0-rosetta-ubuntu+2
COPY entrypoint.sh .
COPY wait-for-it.sh .
RUN chmod +x *.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["./main-amd64"]