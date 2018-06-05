FROM debian:stretch

ENV http_proxy=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV https_proxy=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV HTTP_PROXY=http://CptLinuxWeb:LinuxWeb@b10.169.119.6:3128
ENV HTTPS_PROXY=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV NO_PROXY=127.0.0.1

ENV HTTPD_PREFIX /usr/local/apache2
ENV PATH $HTTPD_PREFIX/bin:$PATH
RUN mkdir -p "$HTTPD_PREFIX" \
    && chown www-data:www-data "$HTTPD_PREFIX"
WORKDIR $HTTPD_PREFIX

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2 curl \
    && rm -r /var/lib/apt/lists/*
RUN a2enmod proxy_fcgi ssl rewrite proxy proxy_balancer proxy_http proxy_ajp
RUN sed -i '/Global configuration/a \
ServerName localhost \
' /etc/apache2/apache2.conf
EXPOSE 80 443
RUN rm -f /run/apache2/apache2.pid
CMD apachectl  -DFOREGROUND -e info