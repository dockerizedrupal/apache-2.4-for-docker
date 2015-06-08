class httpd {
  if $php_host {
    include httpd::php
  }

  if $kerberos_1_realm {
    include httpd::kerberos
  }

  include httpd::server_name
  include httpd::timeout

  if ! file_exists('/httpd/ssl/certs/httpd.crt') {
    include httpd::ssl
  }

  bash_exec { 'mkdir -p /httpd/data': }
}
