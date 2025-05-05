FROM tdewolff/minify:v2.23.3@sha256:9b83566ba0aa4b87ff7071904587e9d750c7647b1f36c481c6001b3e6b99be29 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:72fd2701efcfdedf84819444bf8e8826e5dbc8754c988f916e962d2304019d51
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .