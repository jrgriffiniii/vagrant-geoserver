# == Class: profile::geoserver
#
# Geoserver profile
#
class profile::geoserver {

  # http://sourceforge.net/projects/geoserver/files/GeoServer/2.6.1/geoserver-2.6.1-war.zip
  exec { "download_geoserver" :
    
    command => "/usr/bin/wget http://sourceforge.net/projects/geoserver/files/GeoServer/2.6.1/geoserver-2.6.1-war.zip -O /tmp/geoserver.zip",
    creates => "/tmp/geoserver.zip",
    } ->

  exec { "deploy_geoserver" :
    
    command => "/usr/bin/unzip /tmp/geoserver.zip geoserver.war -d /var/lib/tomcat6/webapps",
    creates => "/var/lib/tomcat/webapps/geoserver.war",
    }
}
