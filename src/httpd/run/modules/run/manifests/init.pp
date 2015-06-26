class run {
  include run::httpd

  if $kerberos_1_realm {
    include run::kerberos
  }
}
