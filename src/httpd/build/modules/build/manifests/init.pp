class build {
  require build::user

  include build::httpd
  include build::kerberos
}
