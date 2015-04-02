#!/usr/bin/env bats

FIG_FILE="${BATS_TEST_DIRNAME}/httpd_kerberos.yml"

container() {
  echo "$(fig -f ${FIG_FILE} ps httpd | grep httpd | awk '{ print $1 }')"
}

setup() {
  fig -f "${FIG_FILE}" up -d --allow-insecure-ssl

  sleep 10
}

teardown() {
  fig -f "${FIG_FILE}" kill
  fig -f "${FIG_FILE}" rm --force
}

@test "httpd: freetds: KERBEROS_DEFAULT_REALM" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'default-realm'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_1_REALM" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'realm-1'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_1_DOMAIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'domain-1'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_1_KDC" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'kdc-1'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_1_ADMIN_SERVER" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'admin-server-1'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_2_REALM" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'realm-2'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_2_DOMAIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'domain-2'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_2_KDC" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'kdc-2'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_2_ADMIN_SERVER" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'admin-server-2'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_3_REALM" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'realm-3'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_3_DOMAIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'domain-3'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_3_KDC" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'kdc-3'"

  [ "${status}" -eq 0 ]
}

@test "httpd: freetds: KERBEROS_3_ADMIN_SERVER" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'admin-server-3'"

  [ "${status}" -eq 0 ]
}
