class role::app::blog {
    class { '::profile::base': }
    class { '::profile::app::blog':} 
}
