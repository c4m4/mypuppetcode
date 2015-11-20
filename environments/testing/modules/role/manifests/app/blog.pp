class role::app::blog {
    include '::profile::base'
    include '::profile::app::blog'
    Class['::profile::base'] -> Class['::profile::app::blog']
}
