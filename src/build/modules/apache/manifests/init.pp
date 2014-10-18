class apache {
  require apache::packages

  exec { 'mkdir -p /apache-2.2.22/conf.d':
    path => ['/bin']
  }

  exec { 'mkdir -p /apache-2.2.22/data':
    path => ['/bin']
  }

  exec { 'mkdir -p /apache-2.2.22/log':
    path => ['/bin']
  }

  exec { 'usermod -d /apache-2.2.22/data www-data':
    path => ['/usr/sbin'],
    require => Exec['mkdir -p /apache-2.2.22/data']
  }

  file { '/var/www':
    ensure => absent,
    recurse => true,
    purge => true,
    require => Exec['usermod -d /apache-2.2.22/data www-data']
  }

  exec { '/bin/bash -c "a2enmod actions"': }
  exec { '/bin/bash -c "a2enmod fastcgi"': }
  exec { '/bin/bash -c "a2enmod vhost_alias"': }
  exec { '/bin/bash -c "a2enmod rewrite"': }
  exec { '/bin/bash -c "a2enmod ssl"': }

  file { '/etc/apache2/apache2.conf':
    ensure => present,
    source => 'puppet:///modules/apache/etc/apache2/apache2.conf',
    mode => 644
  }

  file { '/etc/apache2/envvars':
    ensure => present,
    source => 'puppet:///modules/apache/etc/apache2/envvars',
    mode => 644
  }

  file { '/etc/logrotate.d/apache2':
    ensure => present,
    source => 'puppet:///modules/apache/etc/logrotate.d/apache2',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/apache.conf':
    ensure => present,
    source => 'puppet:///modules/apache/supervisor/conf.d/apache.conf'
  }
}
