#import 'classes/*.pp'
#import 'nodes/*.pp'

class mymon {
	@@nagios_host { "$::fqdn":
	ensure => 'present',
	use => 'generic-host',
    	address => $ipaddress_eth0,
    	tag => "nagios",
        mode => '664',
	max_check_attempts => '3',
	check_command => 'check-host-alive',
	#notify => Service["nagios"]
    } 
}
class myvirt {
@@file { "/tmp/$fqdn":
     content => "[$fqdn]\n other munin stuff here",
     tag => "munin",
}
        File <<| tag == 'munin' |>>
}

######################################################################################################################à

class hg_playground::makowals::brains::db {
class { '::mysql::client':
    package_name => 'mariadb',
}

$override_options = {
    'mysqld' => {
        'log-bin' => '',
        'server-id' => $mysql_server_id,
  }
}
class { '::mysql::server':
    package_name => 'mariadb-server',
    root_password           => 'TESTOWY',
    remove_default_accounts => true,
    override_options        => $override_options,
}

mysql_user { 'slave_user@localhost':
    ensure => 'present',
    password_hash => mysql_password('master_replication'),
}

mysql_grant { 'slave_user@localhost/*.*':
    ensure => 'present',
    options => ['GRANT'],
    privileges => ['REPLICATION SLAVE'],
    table => '*.*',
    user => 'slave_user@localhost',
}

mysql_database { 'somedb':
    ensure => 'present',
    require => Class['mysql::server']
  }
}
######################################################################################################################à

node default {
        #hiera_include('roles', 'role::base')
        #include $::role
	      #include myvirt, mymon
	      include hg_playground::makowals::brains::db
}

node 'puppetclient.example.com' {
	service { 'nagios':
		ensure => 'running'
	}
	include $::role
#	    resources { "nagios_host":
#        	purge => true,
#		noop => true
#    	   }
	Nagios_host <<| tag == 'nagios' |>> { notify => Service["nagios"] }
}
