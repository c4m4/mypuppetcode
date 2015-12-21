class profile::app::blog {
  #class { '::apache': } 
  contain '::apache'

  class { '::mysql::bindings': php_package_name => 'php53-mysql', php_enable => true} ->
  class { '::apache::mod::php': }  ->

    class { 'wordpress':
    db_user        => 'bloguser',
    db_name        =>  'blogdb',
    db_password    => 'blogpassword',
    db_host        => 'localhost',
    create_db      => false,
    create_db_user => false,
    install_dir    => '/var/www/html',
    wp_multisite   => false,
    wp_site_domain => 'blog.domain.com',
    }
}
