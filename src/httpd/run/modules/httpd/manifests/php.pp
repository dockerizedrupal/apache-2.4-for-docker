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

  if $php52_port_9000_tcp {
    file { '/etc/apache2/conf-available/php52.conf':
      ensure => present,
      content => template('httpd/php52.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/conf-enabled/php52.conf':
      ensure => link,
      target => '/etc/apache2/conf-available/php52.conf',
      require => File['/etc/apache2/conf-available/php52.conf']
    }
  }

  if $php53_port_9000_tcp {
    file { '/etc/apache2/conf-available/php53.conf':
      ensure => present,
      content => template('httpd/php53.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/conf-enabled/php53.conf':
      ensure => link,
      target => '/etc/apache2/conf-available/php53.conf',
      require => File['/etc/apache2/conf-available/php53.conf']
    }
  }

  if $php54_port_9000_tcp {
    file { '/etc/apache2/conf-available/php54.conf':
      ensure => present,
      content => template('httpd/php54.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/conf-enabled/php54.conf':
      ensure => link,
      target => '/etc/apache2/conf-available/php54.conf',
      require => File['/etc/apache2/conf-available/php54.conf']
    }
  }

  if $php55_port_9000_tcp {
    file { '/etc/apache2/conf-available/php55.conf':
      ensure => present,
      content => template('httpd/php55.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/conf-enabled/php55.conf':
      ensure => link,
      target => '/etc/apache2/conf-available/php55.conf',
      require => File['/etc/apache2/conf-available/php55.conf']
    }
  }

  if $php56_port_9000_tcp {
    file { '/etc/apache2/conf-available/php56.conf':
      ensure => present,
      content => template('httpd/php56.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/conf-enabled/php56.conf':
      ensure => link,
      target => '/etc/apache2/conf-available/php56.conf',
      require => File['/etc/apache2/conf-available/php56.conf']
    }
  }
}
