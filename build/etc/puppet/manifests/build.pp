class packages {
  package {[
      'apache2',
      'libapache2-mod-fastcgi'
    ]:
    ensure => present
  }
}

class apache2_supervisor {
  file { '/etc/supervisor/conf.d/apache2.conf':
    ensure => present,
    source => '/tmp/build/etc/supervisor/conf.d/apache2.conf'
  }
}

class apache2 {
  include apache2_supervisor

  file { '/var/www/index.html':
    ensure => absent
  }

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent
  }

  file { '/etc/apache2/sites-available/default-ssl':
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

  exec { '/bin/bash -c "a2enmod actions"': }
  exec { '/bin/bash -c "a2enmod fastcgi"': }
  exec { '/bin/bash -c "a2enmod vhost_alias"': }
  exec { '/bin/bash -c "a2enmod rewrite"': }

  file { '/etc/apache2/apache2.conf':
    ensure => present,
    source => '/tmp/build/etc/apache2/apache2.conf',
    mode => 644
  }
}

node default {
  file { '/run.sh':
    ensure => present,
    source => '/tmp/build/run.sh',
    mode => 755
  }

  include packages
  include apache2

  Class['packages'] -> Class['apache2']

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