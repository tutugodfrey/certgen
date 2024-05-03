FROM php:8.2-cli
RUN apt update && apt install snapd -y
RUN curl -OL https://github.com/acquia/cli/releases/latest/download/acli.phar
RUN chmod +x acli.phar
RUN mv acli.phar /usr/local/bin/acli
ARG ACLI_KEY
ARG ACLI_SECRET
ENV ACLI_KEY=${ACLI_KEY}
ENV ACLI_SECRET=${ACLI_SECRET}
CMD [ "/bin/sh", "-c", "acli list --raw" ]
