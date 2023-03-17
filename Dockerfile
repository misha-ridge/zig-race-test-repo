# go dynamically links to glibc (?)
FROM busybox:1.36.0-glibc

RUN wget https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.1987+a2c6ecd6d.tar.xz
RUN tar xf zig-linux-x86_64-0.11.0-dev.1987+a2c6ecd6d.tar.xz
RUN mv /zig-linux-x86_64-0.11.0-dev.1987+a2c6ecd6d /zig
RUN wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
RUN tar xf go1.20.2.linux-amd64.tar.gz

COPY . /
RUN cd pkg && CC='/zig/zig cc' /go/bin/go test -race .
