FROM debian:12.4-slim@sha256:f4a83aa865a2b4a064ff142aa91c713180df9fcb86ce676b5de2981029379c37 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:57ea79bc1217d8345ef15f7f65153460f5d81c4d28b2e2d63df142dc73fd89f0
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .