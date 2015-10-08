class profile::base {
  anchor { 'profile::base::begin': } ->
    class { '::profile::users::admins': } ->
    class { '::ssh::server': } ->
    class { '::ntp': } ->
  anchor { 'profile::base::end': }
}
