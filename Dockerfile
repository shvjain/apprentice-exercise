FROM golang:1.27-trixie AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY main.go ./
RUN CGO_ENABLED=0 go build -o server .

FROM alpine:3.24
COPY --from=build /app/server /server
EXPOSE 3000
CMD ["/server"]
