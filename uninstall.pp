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

exec { 'autoremove-mysql-server':
    command => '/usr/bin/apt-get autoremove --purge -y',
    refreshonly => true,
    subscribe => package['mysql-server'],
}

exec { 'autoremove-mysql-client':
    command => '/usr/bin/apt-get autoremove --purge -y',
    refreshonly => true,
    subscribe => package['mysql-client'],
}

exec { 'autoremove-mysql':
    command => '/usr/bin/apt-get autoremove --purge -y',
    refreshonly => true,
    subscribe => package['mysql'],
}



file { "remove_wordpress":
ensure => absent,
path => "/var/www",
recurse => true,
purge => true,
force =>true,
}
