#!/bin/sh

echo "$(date +"%b %d %H:%M:%S") $HOSTNAME start.sh[$$]: Creating User Entry in sasldb"
# sasldb2
echo $smtp_user | tr , \\n > /tmp/passwd
while IFS=':' read -r _user _pwd; do
  echo $_pwd | saslpasswd2 -p -c -u $maildomain $_user
done < /tmp/passwd
chown postfix.sasl /etc/sasldb2

postfix start
echo "$(date +"%b %d %H:%M:%S") $HOSTNAME start.sh[$$]: ➔ Switching to log output from '/var/log/mail.log'"
echo "$(date +"%b %d %H:%M:%S") $HOSTNAME start.sh[$$]: System is now operational and ready to receive E-Mails" >> /var/log/mail.log
tail -f /var/log/mail.log