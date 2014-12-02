case $operatingsystem {
        redhat,centos,fedora: { $web = 'httpd' }
        debian,ubuntu: { $web = 'apache2' }
        default: { $web = 'apache2' }
}

define apachevhost ($root, $servername){
    file { $root:
                ensure  => 'directory',
         }
    file { "/etc/apache2/vhosts.d/${servername}.conf":
                ensure  => 'file',
                content => template('apache.erb'),
         }
}

class apache {
        package { $web:
                ensure => 'installed'
        }
        service { $web:
                name       => $web,
                ensure     => running,
                enable     => true,
                hasrestart => true,
                require => Package[$web],
        }

        apachevhost { 'myapp.example.com':
                servername => 'myapp.example.com',
                root => "/srv/www/html/myapp.example.com"
        }
        apachevhost { 'myapp1.example.com':
                servername => 'myapp1.example.com',
                root => "/srv/www/html/myapp1.example.com"
        }
        apachevhost { 'myapp2.example.com':
                servername => 'myapp2.example.com',
                root => "/srv/www/html/myapp2.example.com"
        }
        apachevhost { 'myapp3.example.com':
                servername => 'myapp3.example.com',
                root => "/srv/www/html/myapp3.example.com"
        }
        Package[$web] -> Apachevhost['myapp.example.com'] ~> Service[$web]
        Package[$web] -> Apachevhost['myapp1.example.com'] ~> Service[$web]
        Package[$web] -> Apachevhost['myapp2.example.com'] ~> Service[$web]
        Package[$web] -> Apachevhost['myapp3.example.com'] ~> Service[$web]
}
