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
  		mode    => '600',
  		owner   => '0',
		backup => 'true'
	}
	ssh_authorized_key { 'root@puppetclient.example.com':
	user => 'root',
	type => 'ssh-rsa',
	key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDQefXpLf+vs/aTs9Uomg1fvMvN0ofuN1+d2nwjZ0eb/yw3/s2hTbU8Wa6enqsMJiieutfdzFFm034B4OH3B0O4GN0oZTFKoR86y12WoAYi/ChXnkaWkidxgQfz/XDxek9imX5qUG9ZzlvF6TFzZwm7QOu75OmTqSfPUNMxF/PfGtpT7PP8Drz5BdGwMAENXkoD4+6KIKsrDJVaEeFPQzN7DHylCb3/dinftKemTxqhbtbQt8ipK0BU84Qm79106A5cHLnJGP9tbEAz1tTU0KoO1q9aEBCnJ6zZehkuPdUOI2aaJ8+Qi7pbqBf80zwpx0cy8zriTh2uEI1guxeaEPMp',
	}

	File['/root/.ssh'] -> File['/root/.ssh/authorized_keys'] -> Ssh_authorized_key['root@puppetclient.example.com']
}
