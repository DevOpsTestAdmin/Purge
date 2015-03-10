


service { "apache2":
  ensure => "stopped",
}

package { "apache2.2":
ensure => "purged",
subscribe => service['apache2'],
}

package { "apache2":
ensure => "purged",
subscribe => service['apache2'],
}



package { "apache2-utils":
ensure => "purged",
subscribe => service['apache2'],
}



exec { 'autoremove-apache2.2':
    command => '/usr/bin/apt-get autoremove --purge -y',
    refreshonly => true,
    subscribe => package['apache2.2'],
}




