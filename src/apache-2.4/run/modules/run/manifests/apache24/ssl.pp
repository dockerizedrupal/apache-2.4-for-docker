class run::apache24::ssl {
  bash_exec { 'mkdir -p /apache/ssl': }

  bash_exec { 'mkdir -p /apache/ssl/private':
    require => Bash_exec['mkdir -p /apache/ssl']
  }

  bash_exec { 'mkdir -p /apache/ssl/certs':
    require => Bash_exec['mkdir -p /apache/ssl/private']
  }

  if $certbot == "Off" {
    file { '/root/opensslCA.cnf':
      ensure => present,
      content => template('run/opensslCA.cnf.erb'),
      require => Bash_exec['mkdir -p /apache/ssl/certs']
    }

    bash_exec { 'openssl genrsa -out /apache/ssl/private/apache-2.4CA.key 4096':
      timeout => 0,
      require => File['/root/opensslCA.cnf']
    }

    bash_exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /apache/ssl/private/apache-2.4CA.key -out /apache/ssl/certs/apache-2.4CA.crt":
      timeout => 0,
      require => Bash_exec['openssl genrsa -out /apache/ssl/private/apache-2.4CA.key 4096']
    }

    bash_exec { 'openssl genrsa -out /apache/ssl/private/apache-2.4.key 4096':
      timeout => 0,
      require => Bash_exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /apache/ssl/private/apache-2.4CA.key -out /apache/ssl/certs/apache-2.4CA.crt"]
    }

    file { '/root/openssl.cnf':
      ensure => present,
      content => template('run/openssl.cnf.erb'),
      require => Bash_exec['openssl genrsa -out /apache/ssl/private/apache-2.4.key 4096']
    }

    bash_exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /apache/ssl/private/apache-2.4.key -out /apache/ssl/certs/apache-2.4.csr":
      timeout => 0,
      require => File['/root/openssl.cnf']
    }

    bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /apache/ssl/certs/apache-2.4.csr -CA /apache/ssl/certs/apache-2.4CA.crt -CAkey /apache/ssl/private/apache-2.4CA.key -out /apache/ssl/certs/apache-2.4.crt":
      timeout => 0,
      require => Bash_exec["openssl req -sha256 -new -config /root/openssl.cnf -key /apache/ssl/private/apache-2.4.key -out /apache/ssl/certs/apache-2.4.csr"]
    }
  }
}
