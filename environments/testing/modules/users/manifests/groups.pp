class users::groups {
	group { 'admins':
	  ensure => 'present',
  	  gid    => '1500',
	}
}
