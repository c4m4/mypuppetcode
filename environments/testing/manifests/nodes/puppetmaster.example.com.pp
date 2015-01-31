node 'puppetmaster.example.com' {
	hiera_include('roles', '[ "role::base" ]')
}
