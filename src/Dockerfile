FROM tdewolff/minify:v2.21.1@sha256:4471e23ff3e944f8d7ef7928763e8189dc56177e38fc7028fcd06344e246b6d3 AS minifier
WORKDIR /src/homepage
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
RUN for ext in "css" "js" "png" "jpg"; do find . -name "*.$ext" -exec gzip -9k {} \;; done

FROM nginxinc/nginx-unprivileged:1.27.2-alpine-slim@sha256:ce270198978c32cdded8bcaa874781e12fd6c441398529fa98d7e259df4cb420
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .