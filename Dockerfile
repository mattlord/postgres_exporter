FROM debian:10-slim
RUN useradd -u 20001 postgres_exporter \
    && apt-get update \
    && apt-get -y install socat ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

FROM scratch

COPY --from=0 /etc/passwd /etc/passwd
USER postgres_exporter

ARG binary

COPY $binary /postgres_exporter

EXPOSE 9187

ENTRYPOINT [ "/postgres_exporter" ]
