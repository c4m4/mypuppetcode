include users

class osadmins {
	$my_linuxadmins = hiera('linuxadmins',{})
	create_resources("@users::admins", $my_linuxadmins)
#	realize(Users::Admins[wzqbf1])
	Users::Admins <||>
}
