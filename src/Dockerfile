FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:ca2305d71219043ad4cdf91d588b5a4f94d6bc3cd44bfd8667cee0b6c121b712
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .