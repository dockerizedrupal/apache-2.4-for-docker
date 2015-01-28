class httpd {
  require httpd::php

  if ! file_exists('/httpd/ssl/certs/httpd.crt') {
    require httpd::ssl
  }

  exec { 'mkdir -p /httpd/data':
    path => ['/bin']
  }
}
