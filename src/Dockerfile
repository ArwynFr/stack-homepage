FROM tdewolff/minify:v2.24.6@sha256:b542c8c03f736f6c0e13129078967affb985102ac23978111e17beffd5d769b7 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:67e84141b0c84bdb1e2ed03b73c7345d678a0faecce9f5de2c1120b800ea7b94
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .