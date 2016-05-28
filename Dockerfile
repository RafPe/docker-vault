FROM ubuntu:14.04

# Install Docker prerequisites
RUN apt-get update && \
    apt-get install -qy unzip \
                        wget  \
                        vim   \
                        supervisor \
                        curl  \
    && wget https://releases.hashicorp.com/vault/0.5.3/vault_0.5.3_linux_amd64.zip \
    && unzip vault_0.5.3_linux_amd64.zip \
    && mv vault /usr/bin/ \
    && rm vault_0.5.3_linux_amd64.zip \
    && mkdir /etc/vault

COPY vault.hcl /etc/vault/vault.hcl
COPY supervisord.conf /etc/supervisor/supervisord.conf

VOLUME /etc/vault
VOLUME /etc/supervisor
VOLUME /data

EXPOSE 8200 

ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-n"]
