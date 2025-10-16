FROM tdewolff/minify:v2.24.4@sha256:9e3ddf38e66181f6e966723507dbbff5dfc592e833066fd6e12e40d5d9de78d5 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:7e5a9a620fbf78f0ad3565a1e5527d5d4509381d16b08501b656cf5251b339ce
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .