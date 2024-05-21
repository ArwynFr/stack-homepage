FROM debian:12.5-slim@sha256:804194b909ef23fb995d9412c9378fb3505fe2427b70f3cc425339e48a828fca as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.26.0-alpine-slim@sha256:ca6c2c3bed6cba473d2bcc8e5583b562ee335d043b9c72dc0eab983f6dd3a49c
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .