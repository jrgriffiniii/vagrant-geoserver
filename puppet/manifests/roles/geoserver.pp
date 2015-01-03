# == Class: role::geoserver
#
# Web application server profile
#
class role::geoserver {

  include profile::base
  include profile::java
  include profile::tomcat
  include profile::geoserver
}
