class role::app::blog {
  anchor { 'role::app::blog::begin': } ->
    class { '::profile::base': } ->
    class { '::profile::app::blog':} ->
  anchor { 'role::app::blog::end': }
}
