class httpd::kerberos {
  file { '/etc/krb5.conf':
    ensure => present,
    content => template('httpd/krb5.conf.erb'),
    mode => 644
  }
}
