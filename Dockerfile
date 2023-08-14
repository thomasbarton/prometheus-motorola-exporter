FROM golang:1.21-alpine3.18 AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . .
RUN go build -ldflags="-w -s" ./cmd/prometheus-moto-exporter

FROM alpine:3.18
COPY --from=builder /app/prometheus-moto-exporter /go/bin/prometheus-moto-exporter

EXPOSE 9731
CMD ["/go/bin/prometheus-moto-exporter", "--bind", "0.0.0.0:9731"]
