include apache::pkg, apache::svc

define apache::vhost ($root, $servername){
    file { $root:
                ensure  => 'directory',
         }
    file { "/etc/httpd/conf/virtual/${servername}.conf":
                ensure  => 'file',
                content => template('apache.erb'),
		notify => Class['apache::svc']
         }
}

class apache {
	Class['apache::pkg'] -> Class['apache::svc']
}
