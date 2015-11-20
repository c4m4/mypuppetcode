class profile::users::dba {
	#include ::users
  contain ::users
        create_resources("users::admins", hiera_hash('mysqladmins',{}))
}
