class run {
  require run::user

  include run::apache24

  if $kerberos_1_realm {
    include run::kerberos
  }
}
