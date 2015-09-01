class run {
  require run::user

  include run::apache24
  include run::apache24::permissions

  if $kerberos_1_realm {
    include run::kerberos
  }
}
