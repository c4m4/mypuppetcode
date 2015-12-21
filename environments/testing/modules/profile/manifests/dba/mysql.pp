class profile::dba::mysql {
    anchor { 'profile::dba::mysql::begin': } ->
      class { '::mysql::server':
           root_password    => hiera('mysql_root_password','dbpassword'),
           override_options => { 'mysqld' => { 'max_connections' => '1024' } },
        } ->
    anchor { 'profile::dba::mysql::end': } 

    class { '::profile::users::dba': }

    create_resources("mysql::db", hiera_hash('mysqldbs', '{}'))
}
