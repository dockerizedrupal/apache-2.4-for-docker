class php {
  $php52_port_9000_tcp = dnsLookup($php52_port_9000_tcp)

  if $php52_port_9000_tcp {
    file { '/etc/apache2/conf.d/php52':
      ensure => present,
      content => template('php/php52.erb'),
      mode => 644
    }
  }

  $php53_port_9000_tcp = dnsLookup($php53_port_9000_tcp)

  if $php53_port_9000_tcp {
    file { '/etc/apache2/conf.d/php53':
      ensure => present,
      content => template('php/php53.erb'),
      mode => 644
    }
  }

  $php54_port_9000_tcp = dnsLookup($php54_port_9000_tcp)

  if $php54_port_9000_tcp {
    file { '/etc/apache2/conf.d/php54':
      ensure => present,
      content => template('php/php54.erb'),
      mode => 644
    }
  }

  $php55_port_9000_tcp = dnsLookup($php55_port_9000_tcp)

  if $php55_port_9000_tcp {
    file { '/etc/apache2/conf.d/php55':
      ensure => present,
      content => template('php/php55.erb'),
      mode => 644
    }
  }

  $php56_port_9000_tcp = dnsLookup($php56_port_9000_tcp)

  if $php56_port_9000_tcp {
    file { '/etc/apache2/conf.d/php56':
      ensure => present,
      content => template('php/php56.erb'),
      mode => 644
    }
  }
}
