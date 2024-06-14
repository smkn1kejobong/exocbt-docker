FROM ubuntu:20.04
LABEL maintainer="shinau21.personal@gmail.com"
LABEL version="4.3"
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
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x *.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["./main-amd64"]