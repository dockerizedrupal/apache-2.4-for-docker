class run::apache24::conf_available::timeout {
  file { '/etc/apache2/conf-available/timeout.conf':
    ensure => present,
    content => template('run/timeout.conf.erb'),
    mode => 644
  }

  file { '/etc/apache2/conf-enabled/timeout.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/timeout.conf',
    require => File['/etc/apache2/conf-available/timeout.conf']
  }
}
