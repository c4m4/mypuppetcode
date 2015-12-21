class role::app::blog {
  anchor { '::role::app::blog::begin': } ->
    class { '::profile::base': } ->
    class { '::profile::dba::mysql': } ->
  anchor { '::role::app::blog::end': } -> class { '::profile::app::blog': }
}
