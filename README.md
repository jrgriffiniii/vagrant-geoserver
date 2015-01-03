Vagrant box for GeoServer
=================

A prototypal Vagrant box for serving as a GeoServer staging or development environment.

Vagrant plug-ins are specified within the Gemfile (as per the guidance specified within [the following outline of Vagrant 1.5 improvements](https://www.vagrantup.com/blog/vagrant-1-5-plugin-improvements.html#toc_1)).  Currently, ongoing development is primarily focused upon using a CentOS x86_64 VirtualBox image, with Puppet as the provisioner.  OpenJDK 1.7.0 is installed within the CentOS environment, along with Apache Tomcat 6.0.24 and GeoServer 2.6.1.

All contributions are welcome, and your patience is much appreciated as this project is, inevitably, improved in terms of quality and architecture.
