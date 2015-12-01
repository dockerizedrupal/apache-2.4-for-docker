class build::apache24::supervisor {
  file { '/etc/supervisor/conf.d/apache-2.4.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/apache-2.4.conf',
    mode => 644
  }
}
