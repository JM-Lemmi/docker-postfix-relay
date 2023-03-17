```
docker run -p 25:25 --hostname dhbw-relay.test.julian-lemmerich.de \
    -e maildomain=student.dhbw-mannheim.de \
    -e smtp_user=s212689 -e smtp_pwd=passwort123 \
    -e upstreamserver=studgate.dhbw-mannheim.de \
    -e vpn_user=vpnuser -e vpn_pwd=vpnpassword -e vpn_authgroup=authgroup -e vpn_server=drogon.dhbw-mannheim.de \
    --privileged \
    ghcr.io/jm-lemmi/postfix-relay-auth
```