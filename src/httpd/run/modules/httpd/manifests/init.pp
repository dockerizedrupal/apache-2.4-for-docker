class httpd {
  require httpd::php

  if ! file_exists('/httpd/ssl/certs/httpd.crt') {
    require httpd::ssl
  }

  bash_exec { 'mkdir -p /httpd/data': }

  if $kerberos_1_realm {
    include httpd::kerberos
  }
}
