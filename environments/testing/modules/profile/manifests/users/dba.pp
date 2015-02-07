class profile::users::dba {
	include users
        create_resources("users::admins", hiera_hash('mysqladmins',{}))
}
