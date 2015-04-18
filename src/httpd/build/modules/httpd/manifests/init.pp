class httpd {
  require httpd::packages
  require httpd::supervisor
  require httpd::kerberos

  bash_exec { 'usermod -d /httpd/data www-data': }

  bash_exec { 'a2enmod actions': }
  bash_exec { 'a2enmod fastcgi': }
  bash_exec { 'a2enmod vhost_alias': }
  bash_exec { 'a2enmod rewrite': }
  bash_exec { 'a2enmod ssl': }
  bash_exec { 'a2enmod headers': }

  file { '/var/www/index.html':
    ensure => absent
  }

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent
  }

  file { '/etc/apache2/sites-available/default':
    ensure => present,
    source => 'puppet:///modules/httpd/etc/apache2/sites-available/default',
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/default':
    ensure => link,
    target => '/etc/apache2/sites-available/default',
    require => File['/etc/apache2/sites-available/default']
  }

  file { '/etc/apache2/sites-available/default-ssl':
    ensure => present,
    source => 'puppet:///modules/httpd/etc/apache2/sites-available/default-ssl',
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/default-ssl':
    ensure => link,
    target => '/etc/apache2/sites-available/default-ssl',
    require => File['/etc/apache2/sites-available/default-ssl']
  }

  file { '/etc/apache2/apache2.conf':
    ensure => present,
    source => 'puppet:///modules/httpd/etc/apache2/apache2.conf',
    mode => 644
  }
}
