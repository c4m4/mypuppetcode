define users::admins($login, $uid, $gid, $shell, $state, $role){
	 case $role {
      	    1: { $mgroups = 'admins' }
            2: { $mgroups = 'dbausers' }
   	 }
	user { "${login}":
		  name => "${login}",
		  ensure => "$state",
  		  gid    => $gid,
 		  home   => "/home/${login}",
  		  shell  => $shell,
  		  uid    => $uid,
		  groups => [$mgroups],
		  require => [ Group['users'], Group[$mgroups], File["/home/${login}"], File["/home/${login}/.ssh"] ],
	  }
	file { "/home/${login}":
		  ensure => 'directory',
  		  group  => $gid,
                  mode   => '700',
                  owner  => $uid,
	    }
	file { "/home/${login}/.ssh":
		  ensure => 'directory',
  		  group  => $gid,
                  mode   => '700',
                  owner  => $uid,
		  require => File["/home/${login}"]
	     }
	file { "/home/${login}/.ssh/authorized_keys":
                  ensure => 'present',
  		  group  => $gid,
                  mode   => '600',
                  owner  => $uid,
		  require => File["/home/${login}/.ssh"],
		  source => "puppet:///modules/users/${login}_sshpubkey.txt",
	     }
}
