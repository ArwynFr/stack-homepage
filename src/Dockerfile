FROM debian:12.5-slim@sha256:67f3931ad8cb1967beec602d8c0506af1e37e8d73c2a0b38b181ec5d8560d395 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.27.0-alpine-slim@sha256:35c4c6421ff522d54a7e4d0ff4d83d6e7fa533266e38d76073599e04e251796e
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .