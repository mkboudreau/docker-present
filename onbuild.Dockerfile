FROM golang:1.17
MAINTAINER Michael Boudreau <mkboudreau@yahoo.com>

ENV GO111MODULE=off

RUN go get golang.org/x/tools/cmd/present

EXPOSE 3999

WORKDIR /app

ENTRYPOINT ["present"]
CMD ["-http=0.0.0.0:3999", "-use_playground"]

ONBUILD COPY . /app
