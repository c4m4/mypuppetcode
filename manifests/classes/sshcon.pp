class sshcon {
	file { '/root/.ssh':
  		ensure => 'directory',
  		group  => '0',
  		mode   => '700',
  		owner  => '0',
	}
	file { '/root/.ssh/authorized_keys':
  		ensure  => 'file',
  		group   => '0',
  		mode    => '640',
  		owner   => '0',
		require => File['/root/.ssh'],
	}
}
