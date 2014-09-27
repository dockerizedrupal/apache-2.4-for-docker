class php {
  $php52_port = dnsLookup($php52_port)

  if $php52_port {
    file { '/etc/apache2/conf.d/php52':
      ensure => present,
      content => template('php/php52.erb'),
      mode => 644
    }
  }

  $php53_port = dnsLookup($php53_port)

  if $php53_port {
    file { '/etc/apache2/conf.d/php53':
      ensure => present,
      content => template('php/php53.erb'),
      mode => 644
    }
  }

  $php54_port = dnsLookup($php54_port)

  if $php54_port {
    file { '/etc/apache2/conf.d/php54':
      ensure => present,
      content => template('php/php54.erb'),
      mode => 644
    }
  }

  $php55_port = dnsLookup($php55_port)

  if $php55_port {
    file { '/etc/apache2/conf.d/php55':
      ensure => present,
      content => template('php/php55.erb'),
      mode => 644
    }
  }

  $php56_port = dnsLookup($php56_port)

  if $php56_port {
    file { '/etc/apache2/conf.d/php56':
      ensure => present,
      content => template('php/php56.erb'),
      mode => 644
    }
  }
}
