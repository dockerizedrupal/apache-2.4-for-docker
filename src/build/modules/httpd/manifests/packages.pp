class httpd::packages {
  package {[
      'apache2',
      'libapache2-mod-fastcgi'
    ]:
    ensure => present
  }
}
