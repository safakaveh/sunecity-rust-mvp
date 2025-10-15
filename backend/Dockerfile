# ===== Build Stage =====
FROM rust:alpine3.22 AS builder
RUN apk add --no-cache musl-dev openssl-dev pkgconfig bash git

WORKDIR /usr/src/app
COPY Cargo.toml Cargo.lock ./
RUN mkdir src && echo "fn main() {}" > src/main.rs
RUN cargo build --release
RUN rm -rf src

COPY . .
RUN cargo build --release

# ===== Runtime Stage =====
FROM alpine:3.22
RUN apk add --no-cache ca-certificates
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/target/release/sunecity-rust-mvp .
COPY .env .
EXPOSE 8080
EXPOSE 8081
CMD ["./sunecity-rust-mvp"]