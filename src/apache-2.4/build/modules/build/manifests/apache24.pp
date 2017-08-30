class build::apache24 {
  require build::apache24::packages
  require build::apache24::supervisor

  include build::apache24::logs
  include build::apache24::https2

  bash_exec { 'a2enmod actions': }
  bash_exec { 'a2enmod proxy_fcgi': }
  bash_exec { 'a2enmod vhost_alias': }
  bash_exec { 'a2enmod rewrite': }
  bash_exec { 'a2enmod ssl': }
  bash_exec { 'a2enmod headers': }
  bash_exec { 'a2enmod proxy_http': }

  bash_exec { 'rm -rf /var/www': }

  file { '/etc/apache2/sites-enabled/000-default.conf':
    ensure => absent
  }

  file { '/etc/apache2/conf-enabled/other-vhosts-access-log.conf':
    ensure => absent
  }

  file { '/var/log/apache2/other_vhosts_access.log':
    ensure => absent
  }

  file { '/var/log/apache2/access.log':
    ensure => absent
  }

  file { '/var/log/apache2/error.log':
    ensure => absent
  }

  file { '/etc/apache2/envvars':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/envvars',
    mode => 755
  }

  file { '/etc/apache2/conf-available/security.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/apache2/conf-available/security.conf',
    mode => 644
  }

  file { '/etc/apache2/conf-enabled/security.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/security.conf',
    require => File['/etc/apache2/conf-available/security.conf']
  }

  bash_exec { 'mkdir -p /etc/htpasswd': }
}
