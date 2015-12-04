class build::kerberos::packages {
  package {[
      'libapache2-mod-auth-kerb',
      'krb5-user'
    ]:
    ensure => present
  }
}
