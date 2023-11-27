FROM debian:12.2-slim@sha256:6cc67f78e0e8295b4fbe055eba0356648f149daf15db9179aa51fcfa9cc131cd as minifier
WORKDIR /src/homepage
RUN apt-get update --yes
RUN apt-get install --yes --no-install-recommends minify=2.12.4-2
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \; -printf "gzip -9c %p > %p.gz\n" | sh; done

FROM nginxinc/nginx-unprivileged:1.25.3-alpine-slim@sha256:625e985c5ca802353f6a6614d0af0ce7e629c38efdffd470dfebae526601d0b4
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .