FROM tdewolff/minify:v2.21.3@sha256:27681462ac09607d893645ba09410c28e3e05c9e5ff2c0fd8c03ebd8af2adce1 AS minifier
WORKDIR /src/homepage
COPY . .
RUN <<EOF
for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
for ext in "css" "js" "png" "jpg"; do find . -name "*.$ext" -exec gzip -9k {} \;; done
EOF

FROM nginxinc/nginx-unprivileged:1.27.3-alpine-slim@sha256:65f2b40f4d9bd814f38be587d6a6a23d8d62d7a44d3b30df181fc3b10543e063
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .