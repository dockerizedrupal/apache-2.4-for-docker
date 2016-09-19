class run::certbot::supervisor {
  file { '/etc/supervisor/conf.d/certbot.conf':
    ensure => present,
    source => 'puppet:///modules/run/etc/supervisor/conf.d/certbot.conf',
    mode => 644
  }
}
