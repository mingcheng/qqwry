PROJECT="qqwry"
VERSION=$(shell date +%Y%m%d)
COMMIT_HASH=$(shell git rev-parse --short HEAD)
BINARY=qqwry

GO_FLAGS=-ldflags=" \
	-X 'main.version=$(VERSION)' \
	-X 'main.commit=$(COMMIT_HASH)' \
	-X 'main.date=$(shell date)'"
GO=$(shell which go)

all: build

build: test
	@$(GO) build $(GO_FLAGS) -o ${BINARY} .

test: clean
	@go test -v .

docker_image:
	@docker-compose build

clean:
	@$(GO) clean -testcache
	@rm -f ${BINARY}

.PHONY: fmt install test clean docker_image
