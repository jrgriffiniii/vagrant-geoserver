
node default { }

node 'geoserver-master' {

  # Tomcat for GeoServer
  include tomcat

  # PostgreSQL for GeoServer
  class { 'postgresql::server':

    ip_mask_deny_postgres_user => '0.0.0.0/32',
    ip_mask_allow_all_users    => '0.0.0.0/0',
    listen_addresses           => '*',
    ipv4acls                   => ['hostssl all 192.168.0.0/24 cert'],
    postgres_password          => 'secret',
  }

  # PostGIS for the GeoServer database
  include ::postgis

  postgresql::server::role { 'geoserver':
    
    password_hash => postgresql_password('geoserver', 'secret')
  }

  postgresql::server::db { 'geoserver':
    
    user     => 'geoserver',
    password => postgresql_password('geoserver', 'secret')
  }

  # Apache for the forward proxy
  class { 'apache':

#    mpm_module => 'prefork'
  }

  apache::vhost { 'localhost.localdomain':
    
    port     => '443',
    # docroot  => '/var/www/fourth',
    ssl      => true,
    ssl_cert => '/etc/ssl/localhost.localdomain.cert',
    ssl_key  => '/etc/ssl/localhost.localdomain.key',
  }

  
}



exec { "yum-upgrade":
  
  command => "/usr/bin/sudo /usr/bin/yum upgrade",
}

package { "openjdk-7-jdk":

  require => Exec["yum-upgrade"],
  ensure => installed,
}



class java_7 {


} 
