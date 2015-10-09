class profile::dba::mysql {
    anchor { 'profile::dba::mysql::begin': } ->
	    class { '::profile::db::mysql': } ->
    anchor { 'profile::dba::mysql::end': }
}
