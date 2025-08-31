FROM tdewolff/minify:v2.24.2@sha256:1d2bc11f0c4a436e068b7001fcb520d0d32097d861c07d41c2e36023b7b92c25 AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.1-alpine-slim@sha256:c08c396099a0f66886404a35ec1610380a36ef9b8de2a2ba22dc7ee307d910ed
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .