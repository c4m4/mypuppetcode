define users::admins($name, $uid, $gid, $shell, $state){
	user { $name:
		  name => $name,
		  ensure => "$state",
  		  gid    => $gid,
 		  home   => "/home/${name}",
  		  shell  => $shell,
  		  uid    => $uid,
		  require => [ Group['admins'], File["/home/${name}"], File["/home/${name}/.ssh"] ],
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
}
