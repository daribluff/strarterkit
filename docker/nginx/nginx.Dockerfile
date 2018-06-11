FROM nginx:latest

ENV http_proxy=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV https_proxy=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV HTTP_PROXY=http://CptLinuxWeb:LinuxWeb@b10.169.119.6:3128
ENV HTTPS_PROXY=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV NO_PROXY=127.0.0.1

COPY nginx.conf /etc/nginx/conf.d/default.conf