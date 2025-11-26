FROM tdewolff/minify:v2.24.7@sha256:6acd49f62f74735a8f4e4f262994c30d445777a19078c664b372cf721e8946c8 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:046ac91ce56252873baf4aceb0ff3887c610d28461ca7d8e187cad737818e1e5
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .