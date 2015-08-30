class build::apache24::packages {
  package {[
      'apache2'
    ]:
    ensure => present
  }
}
