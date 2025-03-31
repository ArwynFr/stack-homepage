FROM tdewolff/minify:v2.22.4@sha256:4480b04e109f0761b7476c132c0ffaef1d920ce7d4d1ff4a9a45ad16f4f028e5 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.27.4-alpine-slim@sha256:154d7db418e13bcb29375cfa1f05d77496e986c717b9ba8a831e11077c880358
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .