FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:304079937327a6490d5c89df47c8951d76f05b346d4c6e3b10cba2e266cd4904
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .