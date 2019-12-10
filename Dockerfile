FROM golang:alpine
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.8/main' >> /etc/apk/repositories && \
      apk add --update git libgit2-dev=0.27.3-r0 cmake pkgconfig alpine-sdk && \
      go get github.com/mbtproject/mbt
FROM alpine:3.8
RUN apk --no-cache add git libgit2-dev
COPY --from=0 /go/bin/mbt /usr/local/bin/mbt
