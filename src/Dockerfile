FROM debian:12.5-slim@sha256:67f3931ad8cb1967beec602d8c0506af1e37e8d73c2a0b38b181ec5d8560d395 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.27.0-alpine-slim@sha256:40e17e5d27afecf49dd3545389bc57e9a79fe379cb4934cd0639727cdb638954
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .