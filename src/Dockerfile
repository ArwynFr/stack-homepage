FROM tdewolff/minify:v2.23.10@sha256:0bef3087d505bf87b3eed28c4ecaf90a83b6b9e9dab553ca353dbeace8b6d208 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:e61b77b27c8f3124fad6d19e894ca5b603bcaf6a34a2df035511299dfa6fad35
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .