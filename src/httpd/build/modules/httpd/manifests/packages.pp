class httpd::packages {
  package {[
      'apache2'
    ]:
    ensure => present
  }
}
