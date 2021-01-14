FROM nginx
MAINTAINER MEGHANATH
COPY .index.html /usr/share/nginx/html/
CMD service nginx start && bash
