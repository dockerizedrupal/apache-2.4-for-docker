class httpd::php {
  if $php_host {
    file { '/etc/apache2/conf-available/php.conf':
      ensure => present,
      content => template('httpd/php.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/conf-enabled/php.conf':
      ensure => link,
      target => '/etc/apache2/conf-available/php.conf',
      require => File['/etc/apache2/conf-available/php.conf']
    }
  }
}
