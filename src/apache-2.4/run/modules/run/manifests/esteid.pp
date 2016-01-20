class run::esteid {
  require run::apache24::ssl

  file { '/tmp':
    ensure => directory,
    recurse => true,
    force => true,
    source => 'puppet:///modules/run/tmp'
  }

  bash_exec { 'cd /tmp/esteid && cat *.crt > /apache/ssl/certs/id.crt':
    require => File['/tmp']
  }

  file { '/apache/ssl/revocation':
    ensure => directory,
    recurse => true,
    force => true,
    source => 'puppet:///modules/run/apache/ssl/revocation'
  }

  file { '/usr/local/bin/esteid':
    ensure => present,
    source => 'puppet:///modules/run/usr/local/bin/esteid.sh',
    mode => 755
  }

  bash_exec { '/usr/local/bin/esteid':
    require => File['/usr/local/bin/esteid']
  }
}
