class httpd::ssl {
  exec { 'openssl genrsa -out /root/httpdCA.key 4096':
    timeout => 0,
    path    => ['/usr/bin']
  }

  $subj = "/C=/ST=/L=/O=/CN=$server_name"

  exec { "openssl req -x509 -new -nodes -key /root/httpdCA.key -days 365 -subj $subj -out /root/httpdCA.crt":
    timeout => 0,
    path    => ['/usr/bin'],
    require => Exec['openssl genrsa -out /root/httpdCA.key 4096']
  }

  exec { 'openssl genrsa -out /root/httpd.key 4096':
    timeout => 0,
    path    => ['/usr/bin'],
    require => Exec["openssl req -x509 -new -nodes -key /root/httpdCA.key -days 365 -subj $subj -out /root/httpdCA.crt"]
  }

  exec { "openssl req -new -key /root/httpd.key -subj $subj -out /root/httpd.csr":
    timeout => 0,
    path    => ['/usr/bin'],
    require => Exec['openssl genrsa -out /root/httpd.key 4096']
  }

  exec { "openssl x509 -req -in /root/httpd.csr -CA /root/httpdCA.crt -CAkey /root/httpdCA.key -CAcreateserial -out /root/httpd.crt -days 365":
    timeout => 0,
    path    => ['/usr/bin'],
    require => Exec["openssl req -new -key /root/httpd.key -subj $subj -out /root/httpd.csr"]
  }

  exec { 'cp /root/httpd.crt /etc/ssl/certs/httpd.crt':
    path    => ['/bin'],
    require => Exec["openssl x509 -req -in /root/httpd.csr -CA /root/httpdCA.crt -CAkey /root/httpdCA.key -CAcreateserial -out /root/httpd.crt -days 365"]
  }

  exec { 'cp /root/httpd.key /etc/ssl/private/httpd.key':
    path    => ['/bin'],
    require => Exec["openssl x509 -req -in /root/httpd.csr -CA /root/httpdCA.crt -CAkey /root/httpdCA.key -CAcreateserial -out /root/httpd.crt -days 365"]
  }
}
