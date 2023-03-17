docker run -p 25:25 \
    -e maildomain=student.dhbw-mannheim.de \
    -e smtp_user=s212689 -e smtp_pwd=passwort123 \
    ghcr.io/jm-lemmi/postfix-relay-auth