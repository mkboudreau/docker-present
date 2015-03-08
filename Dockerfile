FROM golang:1.4.2
MAINTAINER Michael Boudreau <mkboudreau@yahoo.com>

RUN go get golang.org/x/tools/cmd/present
COPY present-run /usr/local/bin

EXPOSE 3999

WORKDIR /app

CMD ["/usr/local/bin/present-run"]
