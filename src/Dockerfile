FROM debian:12.7-slim@sha256:36e591f228bb9b99348f584e83f16e012c33ba5cad44ef5981a1d7c0a93eca22 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.27.2-alpine-slim@sha256:d7b15b925f9b38fb7de6146bf29889ed69129825be420b4c970b8758bac762ea
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .