FROM debian:12.6-slim@sha256:f528891ab1aa484bf7233dbcc84f3c806c3e427571d75510a9d74bb5ec535b33 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.27.0-alpine-slim@sha256:3574f1b607852fd7a6a290246b1ba84e206bd2e69ccd897ebdcc61e71f4537ae
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .