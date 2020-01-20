FROM debian:buster-slim as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.3.8-1+b10
COPY index.html .
COPY robots.txt .
COPY sitemap.xml .
COPY css ./css
COPY img ./img
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -c %p > %p.gz\n" | sh; done

FROM nginx:1.17.7-alpine
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .