FROM dcycle/purgecss:1@sha256:1ccf2be76ce8e77af635cfaa52b80e8aeb2eca38d2d3edb28a1c2a01e1554413 AS purger
WORKDIR /src/homepage
COPY www .
RUN find . -name "*.css" -exec purgecss --css {} --content *.html **/*.js --output {} \;

FROM tdewolff/minify:v2.24.15@sha256:e4dda200f163bfeb45bbaf99743b31e7af13e6a450c36c05e34c92e3586f6546 AS minifier
WORKDIR /src/homepage
COPY --from=purger /src/homepage /src/homepage
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
RUN for ext in "css" "js" "html" "mp4" "png" "webp" "webm" "woff2"; do find . -name "*.$ext" -exec gzip -9k {} \;; done

FROM nginxinc/nginx-unprivileged:1.31.3-alpine-slim@sha256:98edb4ebb9aae4d8ff4bd2ea5edc9939cc2f7cd206a20644928ada32a657c052
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=minifier /src/homepage /usr/share/nginx/html
