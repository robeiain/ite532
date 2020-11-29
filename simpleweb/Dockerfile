
# Version 0.0.1
FROM ubuntu:16.04
MAINTAINER Tim Jones "tim.jones@itmasters.edu.au"
RUN apt-get update; apt-get install -y nginx
RUN echo 'this is a bunch of text' \
         >/var/www/html/index.html
RUN echo 'this is more text' \
         >/var/www/html/index1.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
