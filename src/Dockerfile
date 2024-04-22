FROM debian:12.5-slim@sha256:3d5df92588469a4c503adbead0e4129ef3f88e223954011c2169073897547cac as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.5-alpine-slim@sha256:5f0b566c0a525dcf56e85fcff490570fd029dbb589602eac7ccbaaf38f2a7367
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .