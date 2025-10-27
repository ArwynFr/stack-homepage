FROM tdewolff/minify:v2.24.5@sha256:56cc199121988e6bc368587683cadad0e7678c1d20681d2afe66590c867032fa AS minifier
WORKDIR /src/homepage
COPY . .
RUN find . -exec minify -o {} {} \;
RUN find . -exec gzip -9k {} {} \;

FROM nginxinc/nginx-unprivileged:1.29.2-alpine-slim@sha256:369201a09c71d8e97df50f9a1f173e5a4c9f152bf644d18479119b730c161841
WORKDIR /usr/share/nginx/html
COPY --from=minifier /src/homepage .