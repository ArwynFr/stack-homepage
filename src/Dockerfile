FROM tdewolff/minify:v2.24.8@sha256:7d7ba575269b7700f3ac1635532882adfe04b293c98d8548715ca818e782bc0c AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.3-alpine-slim@sha256:a6bec37058b9047ece799c01d98dc6d5aa0542b6583cc69f187652f91331a752
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .