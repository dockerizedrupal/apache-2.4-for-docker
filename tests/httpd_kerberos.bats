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

@test "php: freetds: KERBEROS_DEFAULT_REALM" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'default-realm'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_1_REALM" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'realm-1'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_1_DOMAIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'domain-1'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_1_KDC" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'kdc-1'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_1_SERVER_ADMIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'server-admin-1'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_2_REALM" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'realm-2'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_2_DOMAIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'domain-2'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_2_KDC" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'kdc-2'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_2_SERVER_ADMIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'server-admin-2'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_3_REALM" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'realm-3'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_3_DOMAIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'domain-3'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_3_KDC" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'kdc-3'"

  [ "${status}" -ne 0 ]
}

@test "php: freetds: KERBEROS_3_SERVER_ADMIN" {
  run docker exec "$(container)" /bin/su - root -mc "cat /etc/krb5.conf | grep 'server-admin-3'"

  [ "${status}" -ne 0 ]
}
