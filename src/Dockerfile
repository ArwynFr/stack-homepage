FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim@sha256:6911e788d7662d3fdec529004842a9354846f9b760e24dd24bfc69c7fbb14ee0
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .