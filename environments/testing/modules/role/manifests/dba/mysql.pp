class role::dba::mysql {
  anchor { '::role::dba::mysql::begin': } ->
    class { '::profile::base': } ->
  anchor { '::role::dba::mysql::end': } -> class { '::profile::dba::mysql': }
}
