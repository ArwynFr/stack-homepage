FROM debian:12.5-slim@sha256:155280b00ee0133250f7159b567a07d7cd03b1645714c3a7458b2287b0ca83cb as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.5-alpine-slim@sha256:a62665e25c03d33a271a768ddc8e19bc10ecc5845ba8322d2d1bf92d63182c11
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .