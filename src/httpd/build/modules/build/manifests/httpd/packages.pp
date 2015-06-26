class build::httpd::packages {
  package {[
      'apache2'
    ]:
    ensure => present
  }
}
