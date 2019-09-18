FROM golang:1.13.0-alpine AS builder
LABEL maintainer="Ming Cheng"

# Using 163 mirror for Debian Strech
#RUN sed -i 's/deb.debian.org/mirrors.163.com/g' /etc/apt/sources.list
#RUN apt-get update

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PACKAGE github.com/freshcn/qqwry
ENV GOPROXY https://goproxy.cn
ENV BUILD_DIR ${GOPATH}/src/${PACKAGE}

# Print go version
RUN echo "GOROOT is ${GOROOT}"
RUN echo "GOPATH is ${GOPATH}"
RUN ${GOROOT}/bin/go version

# Build
COPY . ${BUILD_DIR}
WORKDIR ${BUILD_DIR}
RUN go build ${BUILD_DIR} && cp ${BUILD_DIR}/qqwry /usr/bin/qqwry

# Stage2
FROM alpine:3.10.2

# @from https://mirrors.ustc.edu.cn/help/alpine.html
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

COPY --from=builder /usr/bin/qqwry /bin/qqwry
EXPOSE 2060
ENTRYPOINT ["/bin/qqwry"]
