class httpd::timeout {
  file { '/etc/apache2/conf-available/timeout.conf':
    ensure => present,
    content => template('httpd/timeout.conf.erb'),
    mode => 644
  }

  file { '/etc/apache2/conf-enabled/timeout.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/timeout.conf',
    require => File['/etc/apache2/conf-available/timeout.conf']
  }
}
