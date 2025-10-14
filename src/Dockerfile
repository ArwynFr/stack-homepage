FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:12b55754aca7639c7acc6bdf75169c77a212f54d6b976e5402057954614b19e0
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .