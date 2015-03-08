FROM golang:1.4.2
MAINTAINER Michael Boudreau <mkboudreau@yahoo.com>

RUN go get golang.org/x/tools/cmd/present
COPY present-run /app/

EXPOSE 3999

WORKDIR /app

#CMD ["present", "-http=0.0.0.0:3999 -orighost=$EXTERNAL_HOST"]
CMD ["/app/present-run"]
