class httpd::supervisor {
  file { '/etc/supervisor/conf.d/httpd.conf':
    ensure => present,
    source => 'puppet:///modules/httpd/etc/supervisor/conf.d/httpd.conf'
  }
}
