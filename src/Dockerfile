FROM debian:12.2-slim@sha256:2bc5c236e9b262645a323e9088dfa3bb1ecb16cc75811daf40a23a824d665be9 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:61144819aeb7120ccb6826b4c8d3f961325f53754d4eadb52552ff1720a341c8
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .