FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:111ba7c204aea8b2c8767feae04d9703a64369a82b6982a9ad21cb12bd4946f2
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .