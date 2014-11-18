class httpd::php {
  if $php_host {
    file { '/etc/apache2/conf.d/php':
      ensure => present,
      content => template('httpd/php.erb'),
      mode => 644
    }
  }

  if $php52_port_9000_tcp {
    file { '/etc/apache2/conf.d/php52':
      ensure => present,
      content => template('httpd/php52.erb'),
      mode => 644
    }
  }

  if $php53_port_9000_tcp {
    file { '/etc/apache2/conf.d/php53':
      ensure => present,
      content => template('httpd/php53.erb'),
      mode => 644
    }
  }

  if $php54_port_9000_tcp {
    file { '/etc/apache2/conf.d/php54':
      ensure => present,
      content => template('httpd/php54.erb'),
      mode => 644
    }
  }

  if $php55_port_9000_tcp {
    file { '/etc/apache2/conf.d/php55':
      ensure => present,
      content => template('httpd/php55.erb'),
      mode => 644
    }
  }

  if $php56_port_9000_tcp {
    file { '/etc/apache2/conf.d/php56':
      ensure => present,
      content => template('httpd/php56.erb'),
      mode => 644
    }
  }
}
