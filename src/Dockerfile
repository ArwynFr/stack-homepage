FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim@sha256:3239fe9f214f5f27c141f7536d6266ca28a362a5ef8b4f6a46d8e946708d1baf
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .