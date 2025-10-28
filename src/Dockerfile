FROM tdewolff/minify:v2.24.5@sha256:56cc199121988e6bc368587683cadad0e7678c1d20681d2afe66590c867032fa AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:65a7f97c299b919190e96e38e2ff8358132732000d3bc5c00c07cc8763fca53f
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .