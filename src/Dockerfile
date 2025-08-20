FROM tdewolff/minify:v2.24.0@sha256:8ff71f30f82cbc9ec5366fe33253563de1a83376903c8c8989fe234a7556d279 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim@sha256:08d9abede1bbaf8d76431e3899cacb5624fb066b0595f8ec9b078b8aff951fb9
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .