# == Class: profile::tomcat
#
# Tomcat profile
#
class profile::tomcat {

  class { 'epel': } ->
  class { '::tomcat':
    
    install_from_source => false,
  } ->
  tomcat::instance { 'default':
    
    package_name  => 'tomcat',
    } ->
  firewall { '001 allow http and https access for Apache Tomcat':
    
    port   => [8080, 8443],
    proto  => tcp,
    action => accept,
    } ->
  tomcat::service { 'default':
    
    use_jsvc     => false,
    use_init     => true,
    service_name => 'tomcat',
  }
}
