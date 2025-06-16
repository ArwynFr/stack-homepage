FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:b8b6c3f49441658383b6c2afbb97d4a20bb33bffd3f46da89e6447f40989e4ab
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .