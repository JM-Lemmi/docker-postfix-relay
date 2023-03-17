# Postfix Relay with Auth

This Container can run a Postfix Relay with Authentication. It will Authenticate to the upstream server as well as Authenticating downstream clients.

The Variable for username and password will be used for both authentications.

## Image Variants

There are different variants availible. To run with a VPN or without.

### Base Image

```
docker run -p 25:25 --hostname dhbw-relay.test.julian-lemmerich.de \
    -e maildomain=student.dhbw-mannheim.de \
    -e smtp_user=s212689 -e smtp_pwd=passwort123 \
    -e upstreamserver=studgate.dhbw-mannheim.de \
    ghcr.io/jm-lemmi/postfix-relay-auth:base
```

### Anyconnect

Minimum version to build is Docker 20.10

```
docker run -p 25:25 --hostname dhbw-relay.test.julian-lemmerich.de \
    -e maildomain=student.dhbw-mannheim.de \
    -e smtp_user=s212689 -e smtp_pwd=passwort123 \
    -e upstreamserver=studgate.dhbw-mannheim.de \
    -e vpn_user=vpnuser -e vpn_pwd=vpnpassword -e vpn_authgroup=authgroup -e vpn_server=drogon.dhbw-mannheim.de \
    --privileged \
    ghcr.io/jm-lemmi/postfix-relay-auth:anyconnect
```
