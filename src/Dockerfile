FROM debian:12.2-slim@sha256:6cc67f78e0e8295b4fbe055eba0356648f149daf15db9179aa51fcfa9cc131cd as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.2-alpine-slim@sha256:88449880ba732cc655c717b3dcbaf29b6a4f060cccca61c723682b7a2532ea3d
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .