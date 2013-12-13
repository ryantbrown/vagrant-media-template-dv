class mysql {
    package {
        "mysql-server":
            ensure  => present;
        "mysql":
            ensure => present;
    }
    service { "mysqld":
        enable    => true,
        ensure => running,
        require => Package["mysql-server"];
    }
}