FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:ff89eb8727ea64ca08a649a8eb8074d4b195d708f13197918b68285c78adb7a5
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .