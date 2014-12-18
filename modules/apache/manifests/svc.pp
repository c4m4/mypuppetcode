class apache::svc ($webservice = hiera("wsvc")){
	service { $webservice:
  			ensure => 'running',
  			enable => 'true',
		}
}
