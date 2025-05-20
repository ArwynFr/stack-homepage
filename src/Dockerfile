FROM tdewolff/minify:v2.23.6@sha256:adb501eadb7ae7aec9a372bdb53324a8c93896bcf8684eaf354c4c639f7d0e7f AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:c645eaba745472dad156881b81bdda31f717c352aaf5129c3abbdc0ffb1c437e
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .