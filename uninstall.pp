
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



