FROM debian:12.6-slim@sha256:f528891ab1aa484bf7233dbcc84f3c806c3e427571d75510a9d74bb5ec535b33 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.27.0-alpine-slim@sha256:35c4c6421ff522d54a7e4d0ff4d83d6e7fa533266e38d76073599e04e251796e
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .