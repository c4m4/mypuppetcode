class role::app::blog {
    include '::profile::base'
    include '::profile::users::dba'
    include '::profile::dba::mysql'
    include '::profile::app::blog'
    Class['::profile::base'] -> Class['::profile::dba::mysql'] -> Class['::profile::app::blog']
}
