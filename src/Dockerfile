FROM tdewolff/minify:v2.24.7@sha256:6acd49f62f74735a8f4e4f262994c30d445777a19078c664b372cf721e8946c8 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:cc7630eb9e5114d1df794f5d1b962de76bdb7c79c553eea1c22a6c8217f85322
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .