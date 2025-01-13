FROM tdewolff/minify:v2.21.2@sha256:ffad8b9a0ec6b1b8188ddc8fcd9408ffb830d22514c9f86238d4ba5e30bc8df2 AS minifier
WORKDIR /src/homepage
COPY . .
RUN <<EOF
for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
for ext in "css" "js" "png" "jpg"; do find . -name "*.$ext" -exec gzip -9k {} \;; done
EOF

FROM nginxinc/nginx-unprivileged:1.27.3-alpine-slim@sha256:59083083be29bcaae95a589675abf8b0c4d0a689ce488423ea261cf4e859fb7b
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .