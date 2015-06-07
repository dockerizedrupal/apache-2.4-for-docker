class httpd::server_name {
  file { '/etc/apache2/conf-available/server_name.conf':
    ensure => present,
    content => template('httpd/server_name.conf.erb'),
    mode => 644
  }

  file { '/etc/apache2/conf-enabled/server_name.conf':
    ensure => link,
    target => '/etc/apache2/conf-available/server_name.conf',
    require => File['/etc/apache2/conf-available/server_name.conf']
  }
}
