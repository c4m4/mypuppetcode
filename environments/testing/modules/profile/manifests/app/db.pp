class profile::app::db {
  contain '::profile::db::mysql'
  mysql::db { 'blogdb':
    user     => 'bloguser',
    password => 'blogpassword',
    host     => 'localhost',
    grant    => ['ALL'],
    require  => Class['profile::db::mysql']
  }
}
