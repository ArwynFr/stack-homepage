FROM debian:12.7-slim@sha256:a629e796d77a7b2ff82186ed15d01a493801c020eed5ce6adaa2704356f15a1c as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.27.1-alpine-slim@sha256:7fe6763cabaae2a38e347587ddbca64565f714944a1554135fb41d0798ce18ab
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .