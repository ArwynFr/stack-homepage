FROM debian:12.5-slim@sha256:d02c76d82364cedca16ba3ed6f9102406fa9fa8833076a609cabf14270f43dfc as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.4-alpine-slim@sha256:e6477b83704f3cadaa6a37f0b55dffe310d7b07da09e325bde5c6da8f40b61e5
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .