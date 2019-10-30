FROM nginx:1.17.5-alpine
WORKDIR /usr/share/nginx/html
ADD index.html .
ADD css ./css
ADD img ./img