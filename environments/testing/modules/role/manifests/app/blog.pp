class role::app::blog {
    include '::profile::base'
    include '::profile::dba::mysql'
    class { '::profile::app::blog': require => [Class['::profile::base'], Class['::profile::dba::mysql']] }
}
