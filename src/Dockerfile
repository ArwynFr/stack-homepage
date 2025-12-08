FROM tdewolff/minify:v2.24.7@sha256:6acd49f62f74735a8f4e4f262994c30d445777a19078c664b372cf721e8946c8 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.3-alpine-slim@sha256:a6bec37058b9047ece799c01d98dc6d5aa0542b6583cc69f187652f91331a752
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .