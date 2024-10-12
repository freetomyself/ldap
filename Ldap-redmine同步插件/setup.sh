
# docker pull osixia/openldap:latest

docker stop openldap

docker rm openldap

 docker run -d -p 389:389 -p 636:636 \
--name openldap \
--env LDAP_ORGANISATION="Manage" \
--env LDAP_DOMAIN="test.com" \
--env LDAP_ADMIN_PASSWORD="" \
--env LDAP_CONFIG_PASSWORD="" \
--env LDAP_READONLY_USER="readonly" \
--env LDAP_READONLY_PASSWORD="" \
-v $(pwd)/data/local:/usr/local/ldap \
-v $(pwd)/data/lib:/var/lib/ldap \
-v $(pwd)/data/slapd.d:/etc/ldap/slapd.d \
muen/openldap:develop-dev

docker logs -f --tail 200  openldap
