FROM golang:1.13 AS buildit
WORKDIR /go/src/github.com/rhd-gitops-example/promote-demo/
COPY server.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .
FROM alpine:latest  
WORKDIR /root/
COPY --from=buildit /go/src/github.com/rhd-gitops-example/promote-demo/server .
CMD ["./server"]  