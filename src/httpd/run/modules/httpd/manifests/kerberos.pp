class httpd::kerberos {
  file { '/etc/krb5.conf':
    ensure => present,
    content => template('httpd/krb5.conf.erb'),
    mode => 644
  }

  if file_exists('/etc/apache2/kerberos.krb5keytab') {
    file { '/etc/apache2/sites-enabled/kerberos':
      ensure => present,
      content => template('httpd/kerberos.erb'),
      mode => 400,
      owner => www-data,
      group => www-data,
    }
  }
}
