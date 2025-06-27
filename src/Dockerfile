FROM tdewolff/minify:v2.23.8@sha256:1621604aeb5af3412534290cc701736e53de7390237ef21b6076123c0863d160 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.28.0-alpine-slim@sha256:48049d3b43ed2af5b51404be3ad1edef381a3b393ceedc7abd906f2a1d6ecbe7
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .