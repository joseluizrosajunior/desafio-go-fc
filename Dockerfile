FROM golang:latest as builder
WORKDIR /src
COPY src/ .
RUN go build -o /src/hello-fc ./hello-fc.go

FROM scratch
COPY --from=builder /src/hello-fc /home/hello-fc
CMD ["/home/hello-fc"]