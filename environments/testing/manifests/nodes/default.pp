node default {
#	include osadmins
	hiera_include('classes')
#	realize(users::admins["wzqbf1"])
#	Users::Admins <| gid == 1500 |>
}
