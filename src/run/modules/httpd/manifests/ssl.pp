class httpd::ssl {
  exec { 'mkdir -p /httpd/ssl':
    path => ['/bin']
  }

  exec { 'mkdir -p /httpd/ssl/private':
    path => ['/bin'],
    require => Exec['mkdir -p /httpd/ssl']
  }

  exec { 'mkdir -p /httpd/ssl/certs':
    path => ['/bin'],
    require => Exec['mkdir -p /httpd/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('httpd/opensslCA.cnf.erb'),
    require => Exec['mkdir -p /httpd/ssl/certs']
  }

  exec { 'openssl genrsa -out /httpd/ssl/private/httpdCA.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/opensslCA.cnf']
  }

  exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /httpd/ssl/private/httpdCA.key -out /httpd/ssl/certs/httpdCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /httpd/ssl/private/httpdCA.key 4096']
  }

  exec { 'openssl genrsa -out /httpd/ssl/private/httpd.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /httpd/ssl/private/httpdCA.key -out /httpd/ssl/certs/httpdCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('httpd/openssl.cnf.erb'),
    require => Exec['openssl genrsa -out /httpd/ssl/private/httpd.key 4096']
  }

  exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /httpd/ssl/private/httpd.key -out /httpd/ssl/certs/httpd.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/openssl.cnf']
  }

  exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /httpd/ssl/certs/httpd.csr -CA /httpd/ssl/certs/httpdCA.crt -CAkey /httpd/ssl/private/httpdCA.key -out /httpd/ssl/certs/httpd.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -new -config /root/openssl.cnf -key /httpd/ssl/private/httpd.key -out /httpd/ssl/certs/httpd.csr"]
  }
}
