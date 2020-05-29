FROM golang:1.13 AS buildit
WORKDIR /go/src/github.com/rhd-gitops-example/promote-demo/
COPY server.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .
CMD ["./server"]  