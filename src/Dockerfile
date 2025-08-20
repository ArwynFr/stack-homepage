FROM tdewolff/minify:v2.23.11@sha256:3e245648b418b1abffba4f2f3c2a969080fe943768d677955d416b64e89bb95a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim@sha256:08d9abede1bbaf8d76431e3899cacb5624fb066b0595f8ec9b078b8aff951fb9
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .