# == Class: role::db
#
# Relational database management system web server profile
#
class role::db {

  include profile::base
  include profile::postgis
}
