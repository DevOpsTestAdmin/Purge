
service { "mysql":
  ensure => "stopped",
}


service { "apache2":
  ensure => "stopped",
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


package { "apache2":
ensure => "absent",
require => service['apache2'],
}


exec { 'autoremove-apache':
    command => '/usr/bin/apt-get autoremove --purge -y',
    refreshonly => true,
    subscribe => Package['apache2'],
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

