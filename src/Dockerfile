FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:048f2ea0fc69f5844c721ca4a394f3825ba51a27b47c229a691ea5ed3453d34a
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .