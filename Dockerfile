FROM alpine:3.8

ARG VERSION="v1.0.0-rc26"

RUN apk update
RUN apk add wget libc6-compat bash

RUN mkdir /src/
WORKDIR /src/

RUN wget https://github.com/textileio/textile-go/releases/download/${VERSION}/textile-go_${VERSION}_linux-amd64.tar.gz
RUN tar xvfz textile-go_${VERSION}_linux-amd64.tar.gz
RUN rm textile-go_${VERSION}_linux-amd64.tar.gz
RUN ./install.sh

EXPOSE 5050 40600 40601

COPY ./entrypoint.sh /entrypoint.sh

VOLUME /textile

ENTRYPOINT ["/entrypoint.sh"]
