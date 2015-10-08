class role::dba::mysql {
  anchor { 'role::dba::mysql::begin': } ->
    class { '::profile::base': } ->
    class { '::profile::users::dba': } ->
    class { '::profile::db::mysql': } ->
  anchor { 'role::dba::mysql::end': }
}
