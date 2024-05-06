FROM debian:12.5-slim@sha256:155280b00ee0133250f7159b567a07d7cd03b1645714c3a7458b2287b0ca83cb as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.26.0-alpine-slim@sha256:307d357c75f346ffaf359af4c093831499c179406f42170b69ffc9cf3ee3704b
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .