
# Deprecated; Work-around for Vagrant
import 'profiles/*.pp'
import 'roles/*.pp'

node /^db\d*/ {

  include role::db
}

node /^www\d*/ {

  include role::www
}

node /^geoserver\d*/ {

  include role::geoserver
}

node /^geo\d*/ {

  include role::geo
}

node default { }
