class httpd {
  if $server_name {
    include httpd::server_name
  }

  if $php_host {
    include httpd::php
  }

  if $kerberos_1_realm {
    include httpd::kerberos
  }

  if $timeout {
    include httpd::timeout
  }

  if ! file_exists('/httpd/ssl/certs/httpd.crt') {
    include httpd::ssl
  }

  bash_exec { 'mkdir -p /httpd/data': }
}
