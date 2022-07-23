FROM golang:1.18 AS builder
LABEL maintainer="Ming Cheng"

ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV PACKAGE github.com/freshcn/qqwry
ENV GOPROXY https://goproxy.cn,direct
ENV BUILD_DIR ${GOPATH}/src/${PACKAGE}

# Build
COPY . ${BUILD_DIR}
WORKDIR ${BUILD_DIR}
RUN go build -o /bin/qqwry ${BUILD_DIR}

# ENTRYPOINT [ "/bin/qqwry" ]

# Stage2
FROM ubuntu:22.04

COPY --from=builder /bin/qqwry /bin/qqwry

EXPOSE 2060
ENTRYPOINT ["/bin/qqwry"]
