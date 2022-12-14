FROM debian:11.5-slim as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.7.2-1+b6
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginx:1.23.3-alpine
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .