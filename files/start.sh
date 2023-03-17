#!/bin/sh

# Client Auth sasldb2
echo "$(date +"%b %d %H:%M:%S") $HOSTNAME start.sh[$$]: Creating User Entry in sasldb"
echo $smtp_pwd | saslpasswd2 -p -c -u $maildomain $smtp_user
chown postfix.sasl /etc/sasldb2

# Upstream Auth
echo "$(date +"%b %d %H:%M:%S") $HOSTNAME start.sh[$$]: Creating Password Database for Upstream Auth"
echo "$upstreamserver $smtp_user@$maildomain:$smtp_pwd" > /etc/postfix/password
chmod 600 /etc/postfix/password
postmap hash:/etc/postfix/password
postconf -e "relayhost=[$upstreamserver]:25" 

# Start Postfix
postfix start
echo "$(date +"%b %d %H:%M:%S") $HOSTNAME start.sh[$$]: ➔ Switching to log output from '/var/log/mail.log'"
echo "$(date +"%b %d %H:%M:%S") $HOSTNAME start.sh[$$]: System is now operational and ready to receive E-Mails" >> /var/log/mail.log
tail -f /var/log/mail.log