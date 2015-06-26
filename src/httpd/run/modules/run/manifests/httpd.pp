class run::httpd {
  if $php_host {
    include run::httpd::conf_available::php
  }

  include run::httpd::conf_available::server_name
  include run::httpd::conf_available::timeout

  if $http and $https {
    if ! file_exists('/httpd/ssl/certs/httpd.crt') {
      require run::httpd::ssl
    }

    file { '/etc/apache2/sites-available/http_https.conf':
      ensure => present,
      content => template('run/http_https.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/http_https.conf':
      ensure => link,
      target => '/etc/apache2/sites-available/http_https.conf',
      require => File['/etc/apache2/sites-available/http_https.conf']
    }

    file { '/etc/apache2/sites-available/http_https-ssl.conf':
      ensure => present,
      content => template('run/http_https-ssl.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/http_https-ssl.conf':
      ensure => link,
      target => '/etc/apache2/sites-available/http_https-ssl.conf',
      require => File['/etc/apache2/sites-available/http_https-ssl.conf']
    }
  }
  elsif $http {
    file { '/etc/apache2/sites-available/http.conf':
      ensure => present,
      content => template('run/http.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/http.conf':
      ensure => link,
      target => '/etc/apache2/sites-available/http.conf',
      require => File['/etc/apache2/sites-available/http.conf']
    }
  }
  elsif $https {
    if ! file_exists('/httpd/ssl/certs/httpd.crt') {
      require run::httpd::ssl
    }

    file { '/etc/apache2/sites-available/https.conf':
      ensure => present,
      content => template('run/https.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/https.conf':
      ensure => link,
      target => '/etc/apache2/sites-available/https.conf',
      require => File['/etc/apache2/sites-available/https.conf']
    }

    file { '/etc/apache2/sites-available/https-ssl.conf':
      ensure => present,
      content => template('run/https-ssl.conf.erb'),
      mode => 644
    }

    file { '/etc/apache2/sites-enabled/https-ssl.conf':
      ensure => link,
      target => '/etc/apache2/sites-available/https-ssl.conf',
      require => File['/etc/apache2/sites-available/https-ssl.conf']
    }
  }

  bash_exec { 'mkdir -p /httpd/data': }
}
