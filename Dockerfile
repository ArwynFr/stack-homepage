FROM nginx:1.17.5-alpine
WORKDIR /usr/share/nginx/html
COPY index.html .
COPY css ./css
COPY img ./img
