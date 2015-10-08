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

node default {
        #hiera_include('roles', 'role::base')
        include $::role
	      #include myvirt, mymon
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
