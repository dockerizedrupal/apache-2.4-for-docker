class build::certbot {
    file { '/tmp/certbot-0.8.1.tar.gz':
      ensure => present,
      source => 'puppet:///modules/build/tmp/certbot-0.8.1.tar.gz'
    }

    bash_exec { 'cd /tmp && tar xzf certbot-0.8.1.tar.gz':
      require => File['/tmp/certbot-0.8.1.tar.gz']
    }

    bash_exec { 'mv /tmp/certbot-0.8.1/certbot-auto /usr/local/bin/certbot-auto':
      require => Bash_exec['cd /tmp && tar xzf certbot-0.8.1.tar.gz']
    }

    bash_exec { 'rm -rf /tmp/certbot-0.8.1':
      require => Bash_exec['mv /tmp/certbot-0.8.1/certbot-auto /usr/local/bin/certbot-auto']
    }

    bash_exec { 'certbot-auto --non-interactive --os-packages-only':
      require => Bash_exec['rm -rf /tmp/certbot-0.8.1']
    }
}
