class run::apache24::permissions {
  require run::user
  require run::apache24

  bash_exec { 'chown -R container.container /var/lib/apache2': }

  bash_exec { "chown -R container.container $document_root": }

  bash_exec { 'chown -R container.container /apache/ssl': }
}
