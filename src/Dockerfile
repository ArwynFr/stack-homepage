FROM tdewolff/minify:v2.23.1@sha256:2e2091cc0558672d30c2cf095f9f4aff780e9d5f84df68d47a74407696820b74 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:8c63f2de91b27df915c17374fd088c0e73c33fc83fe56ad4812c7be22dcb4765
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .