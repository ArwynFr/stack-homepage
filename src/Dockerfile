FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:7e5a9a620fbf78f0ad3565a1e5527d5d4509381d16b08501b656cf5251b339ce
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .