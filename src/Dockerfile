FROM tdewolff/minify:v2.22.2@sha256:2afa5f9261ebd9225ea0d7f74594f444999b6757db0707f1cb04ede3f17d1c84 AS minifier
WORKDIR /src/homepage
COPY . .
RUN <<EOF
for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
for ext in "css" "js" "png" "jpg"; do find . -name "*.$ext" -exec gzip -9k {} \;; done
EOF

FROM nginxinc/nginx-unprivileged:1.27.4-alpine-slim@sha256:66baf037eb69535e1e478658081d0b89c6af261a2e353d120da1a051765a9731
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .