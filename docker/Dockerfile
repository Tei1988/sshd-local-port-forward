FROM alpine:3.9
EXPOSE 9022

RUN apk add --update --no-cache openssh-server ca-certificates && \
    rm -rf /var/cache/apk/* && \
    addgroup proxy && \
    adduser -D -G proxy proxy && \
    passwd -u proxy && \
    mkdir -p /home/proxy/.ssh && \
    mkdir -p /var/ssh/host_keys && \
    chown -R proxy:proxy /home/proxy/.ssh /var/ssh/host_keys
COPY --chown=proxy:proxy ./sshd_config /etc/ssh/
COPY --chown=proxy:proxy ./entrypoint.sh /opt/

USER proxy:proxy
CMD '/opt/entrypoint.sh'
