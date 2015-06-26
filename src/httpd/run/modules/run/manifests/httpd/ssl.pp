class run::httpd::ssl {
  bash_exec { 'mkdir -p /httpd/ssl': }

  bash_exec { 'mkdir -p /httpd/ssl/private':
    require => Bash_exec['mkdir -p /httpd/ssl']
  }

  bash_exec { 'mkdir -p /httpd/ssl/certs':
    require => Bash_exec['mkdir -p /httpd/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('run/opensslCA.cnf.erb'),
    require => Bash_exec['mkdir -p /httpd/ssl/certs']
  }

  bash_exec { 'openssl genrsa -out /httpd/ssl/private/httpdCA.key 4096':
    timeout => 0,
    require => File['/root/opensslCA.cnf']
  }

  bash_exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /httpd/ssl/private/httpdCA.key -out /httpd/ssl/certs/httpdCA.crt":
    timeout => 0,
    require => Bash_exec['openssl genrsa -out /httpd/ssl/private/httpdCA.key 4096']
  }

  bash_exec { 'openssl genrsa -out /httpd/ssl/private/httpd.key 4096':
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /httpd/ssl/private/httpdCA.key -out /httpd/ssl/certs/httpdCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('run/openssl.cnf.erb'),
    require => Bash_exec['openssl genrsa -out /httpd/ssl/private/httpd.key 4096']
  }

  bash_exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /httpd/ssl/private/httpd.key -out /httpd/ssl/certs/httpd.csr":
    timeout => 0,
    require => File['/root/openssl.cnf']
  }

  bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /httpd/ssl/certs/httpd.csr -CA /httpd/ssl/certs/httpdCA.crt -CAkey /httpd/ssl/private/httpdCA.key -out /httpd/ssl/certs/httpd.crt":
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -new -config /root/openssl.cnf -key /httpd/ssl/private/httpd.key -out /httpd/ssl/certs/httpd.csr"]
  }
}
