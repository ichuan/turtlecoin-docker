FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin

EXPOSE 8070

RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/turtlecoin/turtlecoin/releases/download/v0.22.0/turtlecoin-linux-v0.22.0.tar.gz -O - | tar --strip-components 1 -C /opt/ -xzf -

# cleanup
RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
