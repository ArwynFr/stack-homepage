FROM mcr.microsoft.com/dotnet/sdk:10.0 AS libman
WORKDIR /src/homepage
COPY www .
RUN dotnet tool restore
RUN dotnet tool run libman restore

FROM dcycle/purgecss:1@sha256:1ccf2be76ce8e77af635cfaa52b80e8aeb2eca38d2d3edb28a1c2a01e1554413 AS purger
WORKDIR /src/homepage
COPY --from=libman /src/homepage /src/homepage
RUN find . -name "*.css" -exec purgecss --css {} --content *.html **/*.js --output {} \;

FROM tdewolff/minify:v2.24.8@sha256:7d7ba575269b7700f3ac1635532882adfe04b293c98d8548715ca818e782bc0c AS minifier
WORKDIR /src/homepage
COPY --from=purger /src/homepage /src/homepage
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
RUN for ext in "css" "js" "html" "mp4" "png" "webp" "webm" "woff2"; do find . -name "*.$ext" -exec gzip -9k {} \;; done

FROM nginxinc/nginx-unprivileged:1.29.3-alpine-slim@sha256:d9def221bf58500eb9d2f896367d149af317dce65a67bfdd1260754a4a8bc073
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=minifier /src/homepage /usr/share/nginx/html
