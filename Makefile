NAME    := kcps
LDFLAGS := -ldflags="-s -w -extldflags \"-static\""

.PHONY: build
build:
	go mod tidy

.PHONY: cross-build
cross-build: build
	for os in darwin linux windows; do \
		GOOS=$$os GOARCH=amd64 CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/$(NAME)_$$os; \
	done
