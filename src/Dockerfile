FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:fb7e6a05ba3a45b866c6cf91e24f5cb92e7d84c0c40fd49208578baf5f050422
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .