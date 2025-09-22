FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim@sha256:526604890696bdb46ca8f9e15a283323238ae8727dcc3ed4d0bc2efc616f76e7
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .