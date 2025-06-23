FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:ce39f4efccd1dddce39a66aac7ffa657c964bb945d2c0572ace87a2f9dc469a1
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .