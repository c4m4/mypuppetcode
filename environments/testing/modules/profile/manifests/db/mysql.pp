class profile::db::mysql {
	class { '::mysql::server':
             root_password    => hiera('mysql_root_password','dbpassword'),
             override_options => { 'mysqld' => { 'max_connections' => '1024' } }
	}
}
