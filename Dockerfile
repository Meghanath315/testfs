FROM nginx
MAINTAINER MEGHANATH
COPY index.html /usr/share/nginx/html/
ENTRYPOINT service nginx start && bash
