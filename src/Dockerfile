FROM debian:12.5-slim@sha256:804194b909ef23fb995d9412c9378fb3505fe2427b70f3cc425339e48a828fca as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.26.0-alpine-slim@sha256:9d742a6544a066f7a7f66e937a62e63974af477a58fa923dae96564c776e8180
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .