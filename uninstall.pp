service { "mysql":
  ensure => "stopped",
}


service { "apache2":
  ensure => "stopped",
}



package { "apache2":
ensure => "purged",
require => service['apache2'],
}

package { "apache2-utils":
ensure => "purged",
require => package['apache2'],
}

package { "apache2.2-bin":
ensure => "purged",
require => package['apache2'],
}

package { "apache2.2-common":
ensure => "purged",
require => package['apache2'],
}

package { "apache2-mpm-prefork":
ensure => "purged",
require => package['apache2'],
}



package { "mysql-server":
ensure => "purged",
require => service['mysql'],
}

package { "mysql-client":
ensure => "purged",
require => service['mysql'],
}


package { "mysql":
ensure => "purged",
require => service['mysql'],
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
