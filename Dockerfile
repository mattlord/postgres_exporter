FROM debian:10-slim
RUN apt-get update \
    && apt-get -y install ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

COPY bin/postgres_exporter /usr/bin/postgres_exporter

EXPOSE 9187

ENTRYPOINT [ "/usr/bin/postgres_exporter" ]
