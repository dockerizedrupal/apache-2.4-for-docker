class build::apache24::packages {
  package {[
      'apache2',
      'apache2-utils'
    ]:
    ensure => present
  }
}
