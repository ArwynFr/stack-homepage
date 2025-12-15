FROM tdewolff/minify:v2.24.8@sha256:7d7ba575269b7700f3ac1635532882adfe04b293c98d8548715ca818e782bc0c AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.3-alpine-slim@sha256:c4bc5501a34cb4354ab79536616cb58d8730905bbf2e3ff5ece1f22670cb5f1e
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .