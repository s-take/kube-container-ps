NAME    := kube-container-ls
LDFLAGS := -ldflags="-s -w -extldflags \"-static\""

.PHONY: build
build:
	go mod tidy

.PHONY: cross-build
cross-build:
	for os in darwin linux windows; do \
		GOOS=$$os GOARCH=$$arch CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/$$os/$(NAME); \
	done

.PHONY: build-linux
build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o dist/test -v

.PHONY: build-mac
build-mac:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o dist/test -v

task1:
	@echo "task1実行"