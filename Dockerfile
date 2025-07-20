FROM rust:alpine3.20 AS builder

# Install musl-dev, openssl-dev, and other needed tools
RUN apk add --no-cache musl-dev openssl-dev pkgconfig curl

WORKDIR /app
COPY . .

ENV OPENSSL_STATIC=1 \
    OPENSSL_LIB_DIR=/usr/lib \
    OPENSSL_INCLUDE_DIR=/usr/include

RUN cargo build --release

FROM alpine:3.20

WORKDIR /app

RUN apk add --no-cache openssl

COPY --from=builder /app/target/release/query_api ./query_api
CMD ["./query_api"]
