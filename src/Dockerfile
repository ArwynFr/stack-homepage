FROM tdewolff/minify:v2.24.5@sha256:56cc199121988e6bc368587683cadad0e7678c1d20681d2afe66590c867032fa AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:947101c7bb9ccc54b5197f0918a9023e24df9ac64f4ae3faae8500599bb1e92a
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .