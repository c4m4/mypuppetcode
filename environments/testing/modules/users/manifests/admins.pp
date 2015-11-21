define users::admins($login, $uid, $gid, $shell, $state, $groups){
  user { $login:
      ensure  => $state,
      name    => $login,
      gid     => $gid,
      home    => "/home/${login}",
      shell   => $shell,
      uid     => $uid,
      groups  => [$groups],
      require => [ Group[$groups], File["/home/${login}"], File["/home/${login}/.ssh"] ],
    }
  file { "/home/${login}":
      ensure => 'directory',
      group  => $gid,
      mode   => '0700',
      owner  => $uid,
      }
  file { "/home/${login}/.ssh":
      ensure  => 'directory',
      group   => $gid,
      mode    => '0700',
      owner   => $uid,
      require => File["/home/${login}"]
      }
  file { "/home/${login}/.ssh/authorized_keys":
      ensure  => 'present',
      group   => $gid,
      mode    => '0600',
      owner   => $uid,
      require => File["/home/${login}/.ssh"],
      source  => "puppet:///modules/users/${login}_sshpubkey.txt",
      }
}
