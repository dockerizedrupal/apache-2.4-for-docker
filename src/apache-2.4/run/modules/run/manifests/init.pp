class run {
  require run::user

  include run::apache24
  include run::apache24::permissions
  include run::timezone

  if $kerberos_1_realm {
    include run::kerberos
  }

  if $esteid == "On" {
    include run::esteid
  }
}
