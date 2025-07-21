FROM tdewolff/minify:v2.23.9@sha256:f9cc21b37957351b6f38ec07cb2e8cd2ac0c85ed53bad28120acea2fe02e3348 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:86df552d36eb24c45d3f5becf6423bd056a3fd235d7085fe3d5ea28ba89a8232
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .