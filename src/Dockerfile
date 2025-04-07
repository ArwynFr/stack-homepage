FROM tdewolff/minify:v2.23.0@sha256:aecee5126bf089008ed32d1a20066c26ef08b6365cb0fa19f517d334121ea6ea AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.27.4-alpine-slim@sha256:4b81c7186b435f8bfe2ae0684b287dc4729841cb1b5b041ad8f2e00c99eab011
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .