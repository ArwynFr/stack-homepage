FROM tdewolff/minify:v2.23.11@sha256:3e245648b418b1abffba4f2f3c2a969080fe943768d677955d416b64e89bb95a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:a910bc3b8e3d28493ab397a42e882e00346da7a4b7e40f62b281cdc150cbda99
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .