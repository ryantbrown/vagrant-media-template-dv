$epel = "http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
$remi = "http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"

# default paths
Exec { path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"] }

# file defaults
File {
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Package["httpd"],
    notify  => Service["httpd"]
}

# add epel / remi repos and update packages
exec {
    'yum-update':
        command => '/usr/bin/yum -y update',
        timeout => '0',
        require => Exec["epel-repo"];
    "epel-repo":
        command => "/bin/rpm -Uvh $epel",
        creates => "/etc/yum.repos.d/epel.repo",
        alias   => "epel-repo";
    "remi-repos":
        command => "/bin/rpm -Uvh $remi",
        creates => "/etc/yum.repos.d/remi.repo",
        alias => "remi-repos";
}

# install essential packages
package {[
    "curl",
    "vim-common",
    "git",
    "mod_ssl",
    ]: ensure => present;
}

# include modules
include apache
include mysql
include php