FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:ef0100e39ffe377a42ad99e1f644b78097a84f1ac60a90eac3b888196b2eeb00
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .