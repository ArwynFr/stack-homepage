FROM debian:12.4-slim@sha256:7802002798b0e351323ed2357ae6dc5a8c4d0a05a57e7f4d8f97136151d3d603 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:9c0ff8cdbfbdaa633630312ffc8e1553b60af46319375c44318e3cf8bbf70bdc
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .