FROM debian:12.5-slim@sha256:3d5df92588469a4c503adbead0e4129ef3f88e223954011c2169073897547cac as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.5-alpine-slim@sha256:f6909c9b5cf8e46f72004f38aafa7483d7cb13375ad050d6be7f27989d085bd3
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .