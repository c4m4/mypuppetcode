node 'puppetmaster.example.com' {
	hiera_include('classes', '[ "profile::users::admins" ]')
}
