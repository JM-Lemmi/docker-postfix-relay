FROM debian:11

RUN apt update && apt install -y postfix libsasl2-modules sasl2-bin

## configure postfix
RUN postconf -e 'maillog_file=/var/log/mail.log'
RUN postconf -F '*/*/chroot = n'
RUN echo "dhbw-relay" > /etc/mailname

## configure sasl incoming
# inspired by https://github.com/catatnight/docker-postfix/blob/master/assets/install.sh

# /etc/postfix/main.cf
RUN postconf -e smtpd_sasl_auth_enable=yes
RUN postconf -e broken_sasl_auth_clients=yes
RUN postconf -e smtpd_recipient_restrictions=permit_sasl_authenticated,reject_unauth_destination
# smtpd.conf
COPY ./files/smtpd.conf /etc/postfix/sasl/smtpd.conf


EXPOSE 25

COPY ./files/start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]