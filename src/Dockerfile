FROM debian:12.7-slim@sha256:ad86386827b083b3d71139050b47ffb32bbd9559ea9b1345a739b14fec2d9ecf as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.27.2-alpine-slim@sha256:e62bd7bb3c0fd02d31713d55f3eb06794a0b06e63ad4be9cd4a1589a6c57d4ab
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .