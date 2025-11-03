FROM tdewolff/minify:v2.24.5@sha256:56cc199121988e6bc368587683cadad0e7678c1d20681d2afe66590c867032fa AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:1632c26ddb3249ef8fe939f871f2020dbc00e65f02121a80c66f1dd0cdca9235
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .