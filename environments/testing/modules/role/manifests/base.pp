class role::base {
	include ::profile::users::admins
	include ::ssh::server
}
