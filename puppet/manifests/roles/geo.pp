# == Class: role::geo
#
# World Wide Web (GEOSERVER) server profile
#
class role::geo {

  include profile::base
  include profile::java
  include profile::tomcat
  include profile::geoserver
#  include profile::postgis
}
