FROM httpd:latest
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./left-sidebar.html /usr/local/apache2/htdocs/
COPY ./no-sidebar.html /usr/local/apache2/htdocs/
COPY ./right-sidebar.html /usr/local/apache2/htdocs/
ADD /assets /usr/local/apache2/htdocs/assets/
ADD /images /usr/local/apache2/htdocs/images/
