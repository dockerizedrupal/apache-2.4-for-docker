class httpd {
  require httpd::php

  file { '/etc/apache2/conf-available/server_name.conf':
    ensure => present,
    content => template('httpd/krb5.conf.erb'),
    mode => 644
  }

  file { '/etc/apache2/conf-enabled/server_name.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/server_name.conf',
    require => File['/etc/apache2/conf-available/server_name.conf']
  }

  if ! file_exists('/httpd/ssl/certs/httpd.crt') {
    require httpd::ssl
  }

  bash_exec { 'mkdir -p /httpd/data': }

  if $kerberos_1_realm {
    include httpd::kerberos
  }
}
