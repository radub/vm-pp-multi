class tools {

  # package install list
  $packages = [
    "curl",
    "vim",
    "htop",
    "git-core"
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }

  exec { 'composer-install':
    command => 'curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',
    path    => '/usr/bin:/usr/sbin',
    require => Package['curl'],
  }

#  -> exec { 'drush-install':
#    command => 'composer global require drush/drush:dev-master',
#    environment => ["COMPOSER_HOME=/usr/local/bin"],
#    path    => '/usr/bin:/usr/local/bin:~/.composer/vendor/bin/',
#    require => Exec['composer-install']
#  }

}