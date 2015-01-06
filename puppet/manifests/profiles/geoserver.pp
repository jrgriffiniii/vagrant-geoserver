# == Class: profile::geoserver
#
# Geoserver profile
#
class profile::geoserver {

  $install_destination = '/var/lib/tomcat/webapps' # @todo Resolve why ::tomcat::catalina_home does not resolve to /var/lib/tomcat

  # http://sourceforge.net/projects/geoserver/files/GeoServer/2.6.1/geoserver-2.6.1-war.zip  
  exec { "download_geoserver" :
    
    command => "/usr/bin/wget http://sourceforge.net/projects/geoserver/files/GeoServer/2.6.1/geoserver-2.6.1-war.zip -O /tmp/geoserver.zip",
    creates => "/tmp/geoserver.zip",
    require => Package['unzip']
    } ->

  exec { "deploy_geoserver" :
    
    command => "/usr/bin/unzip /tmp/geoserver.zip geoserver.war -d ${install_destination}",
    creates => "${install_destination}/geoserver.war",
    require => Tomcat::Instance['default']
    }
}
