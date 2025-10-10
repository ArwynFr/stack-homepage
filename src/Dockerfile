FROM tdewolff/minify:v2.24.3@sha256:8533f094fcd548bb7c31139eb606b55e7211f74ad11aa930bb2551983251ab4a AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim@sha256:ba47582e1ad3ad1df0c12a21bf464770c5b995e5f06db4aabead4ab1ae2858c4
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .