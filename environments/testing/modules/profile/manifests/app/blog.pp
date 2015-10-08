class profile::app::blog {
  class { 'wordpress':
    db_user     => 'bloguser',
    db_name     =>  'blogdb',
    db_password => 'blogpassword',
    db_host     => 'localhost',
    create_db   => false,
    create_db_user => false,
    install_dir => '/var/www/html',
  }

  anchor { 'profile::app::blog::begin': } ->
     class { '::apache': } ->
     class { '::profile::app::db': } ->
     Class['wordpress'] ->
  anchor { '::profile::app::blog::end': }

  class { '::apache::mod::php': }

  package { 'php53-mysql':
    ensure => present,
  }
}
