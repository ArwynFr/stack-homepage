FROM dcycle/purgecss:1@sha256:1ccf2be76ce8e77af635cfaa52b80e8aeb2eca38d2d3edb28a1c2a01e1554413 AS purger
WORKDIR /src/homepage
COPY www .
RUN find . -name "*.css" -exec purgecss --css {} --content *.html **/*.js --output {} \;

FROM tdewolff/minify:v2.24.12@sha256:4984574ecedf6b3214d63389179a30ab70d535f7d67992fda916565286612d8b AS minifier
WORKDIR /src/homepage
COPY --from=purger /src/homepage /src/homepage
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
RUN for ext in "css" "js" "html" "mp4" "png" "webp" "webm" "woff2"; do find . -name "*.$ext" -exec gzip -9k {} \;; done

FROM nginxinc/nginx-unprivileged:1.29.8-alpine-slim@sha256:360465db60105a4cbf5215cd9e5a2ba40ef956978dd94f99707e9674050e38ea
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=minifier /src/homepage /usr/share/nginx/html
