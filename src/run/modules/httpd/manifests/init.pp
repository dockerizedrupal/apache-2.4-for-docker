class httpd {
  require httpd::php

  if ! file_exists('/httpd/ssl/certs/vhost.crt') {
    require httpd::ssl
  }
}
