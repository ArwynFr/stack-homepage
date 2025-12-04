FROM tdewolff/minify:v2.24.7@sha256:6acd49f62f74735a8f4e4f262994c30d445777a19078c664b372cf721e8946c8 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.3-alpine-slim@sha256:b19af7728166c4598a71a775dc08512c3ab9ff2c9627d776280546c332d0b8d9
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .