FROM debian:10-slim
RUN apt-get update \
    && apt-get -y install socat ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

ARG binary

COPY bin/postgres_exporter /postgres_exporter

EXPOSE 9187

ENTRYPOINT [ "/postgres_exporter" ]
