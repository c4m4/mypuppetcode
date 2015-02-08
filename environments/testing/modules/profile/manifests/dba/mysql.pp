class profile::dba::mysql {
	include $::users::dba
	include $::db::mysql
}
