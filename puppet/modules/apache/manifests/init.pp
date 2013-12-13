class apache {
    package {[
        "httpd",
        "httpd-devel"
        ]: ensure => present;
    }
    service { "httpd":
        name      => 'httpd',
        require   => Package["httpd"],
        enable    => true,
        ensure    => running;
    }

    file {
        "/etc/httpd/conf.d/vhost.conf":
            replace => true,
            ensure  => present,
            source  => "/vagrant/puppet/templates/httpd/conf.d/vhost.conf";
        "/etc/httpd/vhosts":
            replace => true,
            ensure  => directory,
            source  => "/vagrant/puppet/templates/httpd/vhosts",
            recurse => true;
    }
}