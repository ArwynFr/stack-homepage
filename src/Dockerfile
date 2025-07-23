FROM tdewolff/minify:v2.23.10@sha256:0bef3087d505bf87b3eed28c4ecaf90a83b6b9e9dab553ca353dbeace8b6d208 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:86df552d36eb24c45d3f5becf6423bd056a3fd235d7085fe3d5ea28ba89a8232
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .