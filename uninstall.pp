service { "mysql":
  ensure => "stopped",
}


service { "apache2":
  ensure => "stopped",
  #before => Package['apache2'],Package['apache2-utils'],Package['apache2.2-bin'],Package['apache2-mpm-prefork'],Package['apache2.2-common'],
}


package { "apache2":
ensure => "purged",
}

package { "apache2-utils":
ensure => "purged",
}

package { "apache2.2-bin":
ensure => "purged",
}

package { "apache2.2-common":
ensure => "purged",
}

package { "apache2-mpm-prefork":
ensure => "purged",
}

package { "mysql-server":
ensure => "purged",
}

package { "mysql-client":
ensure => "purged",
}


package { "mysql":
ensure => "purged",
}


file { "remove_wordpress":
ensure => absent,
path => "/var/www",
recurse => true,
purge => true,
force =>true,
}
