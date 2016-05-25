#
# == Class: apparmor
#
# Install the Apparmor package and make sure /etc/apparmor.d/local exists.
#
# Note that custom Ubuntu profiles are availables at:
# https://github.com/simondeziel/aa-profiles
#
# === Parameters
#
# None.
#
# === Variables
#
# None.
#
# === Examples
#
# include apparmor
#
# === Authors
#
# Simon Deziel <simon.deziel@gmail.com>
#
# === Copyright
#
# Copyright 2012 Simon Deziel
#
class apparmor {

  ensure_resource('package','apparmor', { ensure => present })
  ensure_resource('service','apparmor', { ensure => running })

  $apparmor_d = '/etc/apparmor.d'
  ensure_resource('file','apparmor.d', {
    ensure  => directory,
    path    => $apparmor_d,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['apparmor'],
  })

  ensure_resource('file','apparmor.d.local', {
    ensure  => directory,
    path    => "${apparmor_d}/local",
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['apparmor'],
  })
}
