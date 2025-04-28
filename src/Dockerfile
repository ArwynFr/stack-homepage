FROM tdewolff/minify:v2.23.2@sha256:584f7c921fffacd69dc75364ef8b3c89997eb944c570ff59db3b8b59ad48b06b AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:8c63f2de91b27df915c17374fd088c0e73c33fc83fe56ad4812c7be22dcb4765
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .