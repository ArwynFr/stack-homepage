FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.0-alpine-slim@sha256:5e880573185a7712a62d8837656adfaadf4e8ecdb40723c261ca0c2f0ce3408f
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .