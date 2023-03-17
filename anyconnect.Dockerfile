# https://stackoverflow.com/a/65567427/9397749
# syntax = edrevo/dockerfile-plus

INCLUDE+ ./Dockerfile

## install anyconnect
RUN apt install -y openconnect

COPY ./files/anyconnect-start.sh /start.sh
RUN chmod +x /start.sh
