class php {
  $php52 = dnsLookup('php52.php.dev.docker')
  $php53 = dnsLookup('php53.php.dev.docker')
  $php54 = dnsLookup('php54.php.dev.docker')
  $php55 = dnsLookup('php55.php.dev.docker')
  $php56 = dnsLookup('php56.php.dev.docker')

  file { '/etc/apache2/conf.d/php':
    ensure => present,
    content => template('php/php.erb'),
    mode => 644
  }
}
