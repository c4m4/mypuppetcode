node default {
	include osadmins
#	realize(users::admins["wzqbf1"])
	Users::Admins <| gid == 1500 |>
}
