FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim@sha256:0d019e980f83728002de7a6d8819d0d4af7179046d3946b8b37749953fbb28e6
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .