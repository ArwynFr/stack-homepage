FROM tdewolff/minify:v2.23.1@sha256:2e2091cc0558672d30c2cf095f9f4aff780e9d5f84df68d47a74407696820b74 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.27.4-alpine-slim@sha256:4b81c7186b435f8bfe2ae0684b287dc4729841cb1b5b041ad8f2e00c99eab011
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .