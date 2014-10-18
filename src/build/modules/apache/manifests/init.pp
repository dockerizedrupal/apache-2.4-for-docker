class apache {
  require apache::packages

  exec { 'mkdir -p /apache-2.2.22/data':
    path => ['/bin']
  }

  exec { 'usermod -d /apache-2.2.22/data www-data':
    path => ['/usr/sbin'],
    require => Exec['mkdir -p /apache-2.2.22/data']
  }

  exec { '/bin/bash -c "a2enmod actions"': }
  exec { '/bin/bash -c "a2enmod fastcgi"': }
  exec { '/bin/bash -c "a2enmod vhost_alias"': }
  exec { '/bin/bash -c "a2enmod rewrite"': }
  exec { '/bin/bash -c "a2enmod ssl"': }

  file { '/etc/supervisor/conf.d/apache.conf':
    ensure => present,
    source => 'puppet:///modules/apache/etc/supervisor/conf.d/apache.conf'
  }
}
