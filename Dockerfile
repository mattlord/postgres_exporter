FROM debian:10-slim
RUN apt-get update \
    && apt-get -y install socat ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

ARG binary

COPY ./postgres_exporter /bin/postgres_exporter

EXPOSE 9187

ENTRYPOINT [ "/bin/postgres_exporter" ]
