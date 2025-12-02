FROM tdewolff/minify:v2.24.7@sha256:6acd49f62f74735a8f4e4f262994c30d445777a19078c664b372cf721e8946c8 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:33e2bc73b9ec438d00e752076dd6736e5a1da064d2680e5b946d219a7e98f512
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .