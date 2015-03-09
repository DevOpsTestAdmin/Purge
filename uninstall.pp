package { "mysql-server":
ensure => "purged"
}


package { "apache2":
ensure => "purged"
}


file { "remove_wordpress":
ensure => absent,
path => "/var/www",
recurse => true,
purge => true,
force =>true,
}

