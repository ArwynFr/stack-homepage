FROM tdewolff/minify:v2.23.11@sha256:3e245648b418b1abffba4f2f3c2a969080fe943768d677955d416b64e89bb95a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:e61b77b27c8f3124fad6d19e894ca5b603bcaf6a34a2df035511299dfa6fad35
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .