FROM nginx:1.17.7-alpine
WORKDIR /usr/share/nginx/html
COPY index.html .
COPY robots.txt .
COPY sitemap.xml .
COPY css ./css
COPY img ./img
