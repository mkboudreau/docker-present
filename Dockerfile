FROM golang:1.4.2
MAINTAINER Michael Boudreau <mkboudreau@yahoo.com>

RUN go get golang.org/x/tools/cmd/present

EXPOSE 3999

WORKDIR /app

CMD ["present", "-http=0.0.0.0:3999"]
