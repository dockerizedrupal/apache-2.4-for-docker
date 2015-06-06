class httpd {
  require httpd::packages
  require httpd::supervisor
  require httpd::kerberos

  bash_exec { 'usermod -d /httpd/data www-data': }

  bash_exec { 'a2enmod actions': }
  bash_exec { 'a2enmod proxy_http': }
  bash_exec { 'a2enmod vhost_alias': }
  bash_exec { 'a2enmod rewrite': }
  bash_exec { 'a2enmod ssl': }
  bash_exec { 'a2enmod headers': }

  file { '/var/www/index.html':
    ensure => absent
  }

  file { '/etc/apache2/sites-enabled/000-default.conf':
    ensure => absent
  }

  file { '/etc/apache2/sites-available/default.conf':
    ensure => present,
    source => 'puppet:///modules/httpd/etc/apache2/sites-available/default.conf',
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/default.conf':
    ensure => link,
    target => '/etc/apache2/sites-available/default.conf',
    require => File['/etc/apache2/sites-available/default.conf']
  }

  file { '/etc/apache2/sites-available/default-ssl.conf':
    ensure => present,
    source => 'puppet:///modules/httpd/etc/apache2/sites-available/default-ssl.conf',
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/default-ssl.conf':
    ensure => link,
    target => '/etc/apache2/sites-available/default-ssl.conf',
    require => File['/etc/apache2/sites-available/default-ssl.conf']
  }

  file { '/etc/apache2/conf-available/httpd.conf':
    ensure => present,
    source => 'puppet:///modules/httpd/etc/conf-available/httpd.conf',
    mode => 644
  }

  file { '/etc/apache2/conf-enabled/httpd.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/httpd.conf',
    require => File['/etc/apache2/conf-available/httpd.conf']
  }
}
