class motdclass {
	$servername = "puppetclient.example.com"
	$Name = hiera('firstname', 'nothing')
	file_line { 'motd':
		path => '/etc/motd',
		line => 'Hello Silvia',
	}
	file { 'myfile':
		path => "/etc/myfile",
		ensure => file,
		content => template("first.erb")
	}
}
	
