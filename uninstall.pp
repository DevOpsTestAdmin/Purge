
service { "mysql":
  ensure => "stopped",
}


service { "apache2":
  ensure => "stopped",
}


package { "mysql-server":
ensure => "purged",
before => service['mysql'],
}

package { "mysql-client":
ensure => "purged",
before => service['mysql'],
}


package { "mysql":
ensure => "purged",
before => service['mysql'],
}


package { "apache2":
ensure => "purged",
before => service['apache2'],
}


file { "remove_wordpress":
ensure => absent,
path => "/var/www",
recurse => true,
purge => true,
force =>true,
}

