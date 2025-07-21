FROM rust:1.88.0

WORKDIR /app
COPY . .
ENV BASE_URL=${BASE_URL}
ENV PORT=${PORT}
ENV API_KEY=${API_KEY}
ENV ADMIN_API_KEY=${ADMIN_API_KEY}
ENV POSTGRES_URL=${POSTGRES_URL}
ENV WEBHOOK_URL=${WEBHOOK_URL}
ENV FEATURES=${FEATURES}

RUN cargo build --release

CMD ["./target/release/query_api"]
# CMD ["sleep", "infinity"]
