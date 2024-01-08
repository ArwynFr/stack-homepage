FROM debian:12.4-slim@sha256:f80c45482c8d147da87613cb6878a7238b8642bcc24fc11bad78c7bec726f340 as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:354db8fbe52ba8c185bdcc8ff2df106d11bf45c41ef77b59b255d7ef467c8973
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .