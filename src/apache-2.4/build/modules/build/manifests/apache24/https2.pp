class build::apache24::https2 {
  require build::apache24::packages

  file { '/etc/apt/sources.list.d/testing.list':
    ensure => present,
    source => 'puppet:///modules/build/etc/apt/sources.list.d/testing.list',
    mode => 644
  }

  bash_exec { 'apt-get update':
    require => File['/etc/apt/sources.list.d/testing.list']
  }

  file { '/etc/apt/preferences.d/testing':
    ensure => present,
    source => 'puppet:///modules/build/etc/apt/preferences.d/testing',
    mode => 644,
    require => Bash_exec['apt-get update']
  }

  bash_exec { 'apt-get install -y -t testing apache2':
    require => File['/etc/apt/preferences.d/testing']
  }

  bash_exec { 'a2enmod http2':
    require => Bash_exec['apt-get install -y -t testing apache2']
  }
}
