class httpd::ssl {
  exec { 'openssl genrsa -out /httpd/ssl/private/httpdCA.key 4096':
    timeout => 0,
    path => ['/usr/bin']
  }

  exec { "openssl req -x509 -new -nodes -key /httpd/ssl/private/httpdCA.key -days 365 -subj /C=/ST=/L=/O=/CN=httpd -out /httpd/ssl/certs/httpdCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /httpd/ssl/private/httpdCA.key 4096']
  }

  exec { 'openssl genrsa -out /httpd/ssl/private/httpd.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -x509 -new -nodes -key /httpd/ssl/private/httpdCA.key -days 365 -subj /C=/ST=/L=/O=/CN=httpd -out /httpd/ssl/certs/httpdCA.crt"]
  }

  $subj = "/C=/ST=/L=/O=/CN=$server_name"

  exec { "openssl req -sha256 -new -key /httpd/ssl/private/httpd.key -subj $subj -out /httpd/ssl/certs/httpd.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /httpd/ssl/private/httpd.key 4096']
  }

  exec { "openssl x509 -req -in /httpd/ssl/certs/httpd.csr -CA /httpd/ssl/certs/httpdCA.crt -CAkey /httpd/ssl/private/httpdCA.key -CAcreateserial -out /httpd/ssl/certs/httpd.crt -days 365":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -new -key /httpd/ssl/private/httpd.key -subj $subj -out /httpd/ssl/certs/httpd.csr"]
  }
}
