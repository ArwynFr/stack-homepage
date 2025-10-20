FROM tdewolff/minify:v2.24.4@sha256:9e3ddf38e66181f6e966723507dbbff5dfc592e833066fd6e12e40d5d9de78d5 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:0dd4fb787a1db5dc69d3dd9e21b35177ffe096591b01980a67c5a799e8ce26ed
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .