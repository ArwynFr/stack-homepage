FROM debian:12.0-slim as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.7.2-1+b6
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.23.4-alpine-slim
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .