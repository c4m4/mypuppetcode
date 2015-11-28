class profile::base {
  anchor { 'profile::base::begin': } ->
    class { '::profile::users::admins': } ->
    class { '::ssh::server': storeconfigs_enabled => false, } ->
    class { '::ntp': } ->
  anchor { 'profile::base::end': }
}
