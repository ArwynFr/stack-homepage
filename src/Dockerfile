FROM tdewolff/minify:v2.24.7@sha256:6acd49f62f74735a8f4e4f262994c30d445777a19078c664b372cf721e8946c8 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:13d13f63d80772e27637e4077d95a89d59a92ee461b4d13eefa60423f8855089
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .