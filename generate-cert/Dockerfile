FROM certbot/certbot:latest
ARG ssh_url
ARG domains
ENV ssh_url_env=${ssh_url}
ENV domains_env=${domains}

RUN apk add --no-cache expect openssh

ADD ./generateCert.exp /opt/certbot/tools/
RUN chmod 777 /opt/certbot/tools/generateCert.exp
RUN mkdir -p /root/.ssh

ENTRYPOINT /opt/certbot/tools/generateCert.exp ${ssh_url_env} ${domains_env}
