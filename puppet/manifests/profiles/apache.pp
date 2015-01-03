# == Class: profile::apache
#
# Apache profile
#
class profile::apache {
  
  class {'::apache': }

  apache::vhost { 'localhost.localdomain':
    
    port     => '443',
    # docroot  => '/var/www/fourth',
    ssl      => true,
    ssl_cert => '/etc/ssl/localhost.localdomain.cert',
    ssl_key  => '/etc/ssl/localhost.localdomain.key'
  }
}
