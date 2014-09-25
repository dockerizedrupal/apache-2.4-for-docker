class packages {
  package {[
      'apache2',
      'libapache2-mod-fastcgi'
    ]:
    ensure => present
  }
}

class apache_supervisor {
  file { '/etc/supervisor/conf.d/apache.conf':
    ensure => present,
    source => '/tmp/build/etc/supervisor/conf.d/apache.conf'
  }
}

class apache {
  include apache_supervisor

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

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent
  }

  file { '/etc/apache2/sites-available/default':
    ensure => present,
    source => '/tmp/build/etc/apache2/sites-available/default',
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/default':
    ensure => link,
    target => '/etc/apache2/sites-available/default',
    require => File['/etc/apache2/sites-available/default']
  }

  file { '/etc/apache2/sites-available/default-ssl':
    ensure => present,
    source => '/tmp/build/etc/apache2/sites-available/default-ssl',
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/default-ssl':
    ensure => link,
    target => '/etc/apache2/sites-available/default-ssl',
    require => File['/etc/apache2/sites-available/default-ssl']
  }

  exec { '/bin/bash -c "a2enmod actions"': }
  exec { '/bin/bash -c "a2enmod fastcgi"': }
  exec { '/bin/bash -c "a2enmod vhost_alias"': }
  exec { '/bin/bash -c "a2enmod rewrite"': }
  exec { '/bin/bash -c "a2enmod ssl"': }

  file { '/etc/apache2/apache2.conf':
    ensure => present,
    source => '/tmp/build/etc/apache2/apache2.conf',
    mode => 644
  }

  file { '/etc/apache2/envvars':
    ensure => present,
    source => '/tmp/build/etc/apache2/envvars',
    mode => 644
  }

  file { '/etc/logrotate.d/apache2':
    ensure => present,
    source => '/tmp/build/etc/logrotate.d/apache2',
    mode => 644
  }
}

node default {
  file { '/etc/puppet/manifests':
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    source => '/tmp/build/etc/puppet/manifests',
    mode => 644,
  }

  file { '/etc/puppet/templates':
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    source => '/tmp/build/etc/puppet/templates',
    mode => 644,
  }

  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  include packages
  include apache

  Class['packages'] -> Class['apache']

  file { '/etc/apt/sources.list.d/non-free.list':
    ensure => present,
    source => '/tmp/build/etc/apt/sources.list.d/non-free.list',
    mode => 644,
    before => Class['packages']
  }

  exec { 'apt-get update':
    path => ['/usr/bin'],
    require => File['/etc/apt/sources.list.d/non-free.list']
  }
}
