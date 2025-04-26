FROM tdewolff/minify:v2.23.1@sha256:2e2091cc0558672d30c2cf095f9f4aff780e9d5f84df68d47a74407696820b74 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:020c450126dc6bc75775ddbb98a8b4c6637e5e278de3105ed7e4c97ead608ea8
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .