FROM tdewolff/minify:v2.24.7@sha256:6acd49f62f74735a8f4e4f262994c30d445777a19078c664b372cf721e8946c8 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:8e23ab31c214ee1d7f832d63b2ee768d5cbc270a94a2cba0752fed93ad83e345
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .