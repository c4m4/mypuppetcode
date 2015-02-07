define users::admins($name, $uid, $gid, $shell, $state, $role){
	 case $role {
      	    1: { $mgroups = 'admins' }
            2: { $mgroups = 'dbausers' }
   	 }
	user { $name:
		  name => $name,
		  ensure => "$state",
  		  gid    => $gid,
 		  home   => "/home/${name}",
  		  shell  => $shell,
  		  uid    => $uid,
		  groups => [$mgroups],
		  require => [ Group['users'], Group[$mgroups], File["/home/${name}"], File["/home/${name}/.ssh"] ],
	  }
	file { "/home/${name}":
		  ensure => 'directory',
  		  group  => $gid,
                  mode   => '700',
                  owner  => $uid,
	    }
	file { "/home/${name}/.ssh":
		  ensure => 'directory',
  		  group  => $gid,
                  mode   => '700',
                  owner  => $uid,
		  require => File["/home/${name}"]
	     }
	file { "/home/${name}/.ssh/authorized_keys":
                  ensure => 'present',
  		  group  => $gid,
                  mode   => '600',
                  owner  => $uid,
		  require => File["/home/${name}/.ssh"],
		  source => "puppet:///modules/users/${name}_sshpubkey.txt",
	     }
}
