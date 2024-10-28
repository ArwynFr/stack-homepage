FROM tdewolff/minify:v2.21.1@sha256:4471e23ff3e944f8d7ef7928763e8189dc56177e38fc7028fcd06344e246b6d3 AS minifier
WORKDIR /src/homepage
COPY . .
RUN for ext in "css" "js" "html"; do find . -name "*.$ext" -exec minify -o {} {} \;; done
RUN for ext in "css" "js" "png" "jpg"; do find . -name "*.$ext" -exec gzip -9k {} \;; done

FROM nginxinc/nginx-unprivileged:1.27.2-alpine-slim@sha256:d7b15b925f9b38fb7de6146bf29889ed69129825be420b4c970b8758bac762ea
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .