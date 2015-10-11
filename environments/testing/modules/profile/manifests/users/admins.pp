class profile::users::admins {
	#include ::users
  contain '::users'
        create_resources("users::admins", hiera_hash('linuxadmins',{}))
}
