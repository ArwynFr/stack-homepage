FROM tdewolff/minify:v2.23.5@sha256:96d92b55063295a037e163790450568c6985b65f8978d1468d2f57a50d765cef AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:c66c3f2dd1878e8b0ed33b8477fbd08d509733fe4febf0038e4c2b47bbe80d4c
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .