To see the dynamic link libraries required by a compiled binary:
ldd /path/to/binary
ldd /go/bin/hugo | tr -s [:blank:] '\n' | grep ^/ | xargs -I % echo %

To statically link (embed) C libs into a go binary
go build -ldflags "-linkmode 'external' -extldflags '-static'"

You can pass the same build args to `go install`.
For example: CGO_ENABLED=1 go install -ldflags "-linkmode 'external' -extldflags '-static'" github.com/some/repo
