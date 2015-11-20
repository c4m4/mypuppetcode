class role::dba::mysql {
    include '::profile::base'
    include '::profile::users::dba'
    class { '::profile::dba::mysql': require => [Class['::profile::base'], Class['profile::users::dba']] }
}
