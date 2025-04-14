FROM tdewolff/minify:v2.23.1@sha256:2e2091cc0558672d30c2cf095f9f4aff780e9d5f84df68d47a74407696820b74 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.27.4-alpine-slim@sha256:19c95e4a34d377f2db45eede215f0efd7400b86184524b88ad3971c090911a7b
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .