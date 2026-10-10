FROM golang:1.27-trixie
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY main.go ./
RUN go build -o server .
EXPOSE 3000
CMD ["./server"]
