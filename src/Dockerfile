FROM tdewolff/minify:v2.24.7@sha256:6acd49f62f74735a8f4e4f262994c30d445777a19078c664b372cf721e8946c8 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:03e6e1684234556ad100ce760e6fe3e32cc10eb3a0766abbe58db5ad7597a545
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .