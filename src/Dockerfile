FROM tdewolff/minify:v2.21.2@sha256:ffad8b9a0ec6b1b8188ddc8fcd9408ffb830d22514c9f86238d4ba5e30bc8df2 AS minifier
WORKDIR /src/homepage
COPY . .
RUN <<EOF
for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
for ext in "css" "js" "png" "jpg"; do find . -name "*.$ext" -exec gzip -9k {} \;; done
EOF

FROM nginxinc/nginx-unprivileged:1.27.2-alpine-slim@sha256:0ecccf699036872d01d691cefc568813d409995d3adf6c27be518756b1807ccd
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .