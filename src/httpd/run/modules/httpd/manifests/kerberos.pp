class httpd::kerberos {
  file { '/etc/krb5.conf':
    ensure => present,
    content => template('httpd/krb5.conf.erb'),
    mode => 644
  }

  if file_exists('/etc/apache2/kerberos.krb5keytab') {
    file { '/etc/apache2/sites-available/kerberos.conf':
      ensure => present,
      content => template('httpd/kerberos.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/kerberos.conf':
      ensure => link,
      target => '/etc/apache2/sites-available/kerberos.conf',
      require => File['/etc/apache2/sites-available/kerberos.conf']
    }
  }
}
