FROM tdewolff/minify:v2.24.6@sha256:b542c8c03f736f6c0e13129078967affb985102ac23978111e17beffd5d769b7 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:1632c26ddb3249ef8fe939f871f2020dbc00e65f02121a80c66f1dd0cdca9235
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .