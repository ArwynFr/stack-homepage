FROM tdewolff/minify:v2.23.3@sha256:9b83566ba0aa4b87ff7071904587e9d750c7647b1f36c481c6001b3e6b99be29 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:8c63f2de91b27df915c17374fd088c0e73c33fc83fe56ad4812c7be22dcb4765
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .