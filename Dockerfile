FROM rust:alpine3.20 AS builder

WORKDIR /app
COPY . .

RUN cargo build --release

FROM alpine:3.20

WORKDIR /app
COPY --from=builder /app/target/release/query_api ./query_api
CMD ["./query_api"]
