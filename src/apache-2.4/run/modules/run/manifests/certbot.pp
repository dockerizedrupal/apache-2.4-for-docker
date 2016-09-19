class run::certbot {
  if $https {
    if ! file_exists('/apache/ssl/certs/apache-2.4.crt') {
      require run::apache24::ssl
    }

    file { '/usr/local/bin/certbot_renew_certificate_post_hook':
      ensure => present,
      content => template('run/certbot_renew_certificate_post_hook.sh.erb'),
      mode => 755
    }

    file { '/usr/local/bin/certbot_obtain_certificate':
      ensure => present,
      content => template('run/certbot_obtain_certificate.sh.erb'),
      mode => 755
    }

    file { '/etc/cron.d/certbot':
      ensure => present,
      source => 'puppet:///modules/run/etc/cron.d/certbot',
      mode => 644
    }
  }
}
