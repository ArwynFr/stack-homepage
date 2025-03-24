FROM tdewolff/minify:v2.22.3@sha256:e9d5e8f250991cfe68bc67ecdf91df65cfd07891f578bdd8266fde9b78a50b30 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.27.4-alpine-slim@sha256:2ff8b79ebe8a9bb403306866850faefe2ef9f447841767b25ba4d0b49518b541
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .