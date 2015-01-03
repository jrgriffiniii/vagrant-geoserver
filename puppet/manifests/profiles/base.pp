# == Class: role::base
#
# Relational database management system web server profile
#
class profile::base {

  package { "unzip":

    ensure => "installed"
  }
}
