class users::groups {
	group { 'users':
	  ensure => 'present',
  	  gid    => '100',
	}
        group { 'admins':
          ensure => 'present',
          gid    => '1500',
        }
        group { 'dbausers':
          ensure => 'present',
          gid    => '1600',
        }

}
