FROM tdewolff/minify:v2.21.2@sha256:ffad8b9a0ec6b1b8188ddc8fcd9408ffb830d22514c9f86238d4ba5e30bc8df2 AS minifier
WORKDIR /src/homepage
COPY . .
RUN <<EOF
for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
for ext in "css" "js" "png" "jpg"; do find . -name "*.$ext" -exec gzip -9k {} \;; done
EOF

FROM nginxinc/nginx-unprivileged:1.27.3-alpine-slim@sha256:7cb384522948bb90c5155c97a3afe88e69e42feb4b67c12b278969cc03d28e68
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .