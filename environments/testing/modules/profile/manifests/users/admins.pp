class profile::users::admins {
	include users
        create_resources("users::admins", hiera('linuxadmins',{}))
}