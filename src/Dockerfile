FROM tdewolff/minify:v2.21.3@sha256:27681462ac09607d893645ba09410c28e3e05c9e5ff2c0fd8c03ebd8af2adce1 AS minifier
WORKDIR /src/homepage
COPY . .
RUN <<EOF
for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
for ext in "css" "js" "png" "jpg"; do find . -name "*.$ext" -exec gzip -9k {} \;; done
EOF

FROM nginxinc/nginx-unprivileged:1.27.4-alpine-slim@sha256:a79c2415519c4780ab84c536cdefc3ad7c4ce53a6b50992265fa0de8af340a1f
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .