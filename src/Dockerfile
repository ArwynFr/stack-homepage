FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:8e4b7129bda901acd1ece5169d0fecad5b2c0b1fb6c8ee1a299edd8af45d4ae3
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .