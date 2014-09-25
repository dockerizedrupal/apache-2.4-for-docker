class php {
  file { '/etc/apache2/conf.d/php':
    ensure => present,
    content => template('php/php.erb'),
    mode => 644
  }
}
