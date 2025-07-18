FROM tdewolff/minify:v2.23.9@sha256:f9cc21b37957351b6f38ec07cb2e8cd2ac0c85ed53bad28120acea2fe02e3348 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:77b01fcb2a887ffdffafad6d050f8df3c2810041a31955fddb0fb45f7fcf52be
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .