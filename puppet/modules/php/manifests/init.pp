class php {
    exec {
        "php55":
            command => "/usr/bin/yum -y --enablerepo=remi,remi-test install php php-common",
            require => Exec["remi-repos"],
            alias => "php55";
        "php55modules":
            command => "/usr/bin/yum -y --enablerepo=remi,remi-test install php-mysql php-gd php-mbstring php-mcrypt php-xml php-cli php-pear php-pdo",
            require => Exec["remi-repos"],
            alias => "php55modules";
    }
    file { "/etc/php.ini":
        replace => true,
        ensure  => present,
        source  => "/vagrant/puppet/templates/php.ini";
    }
}