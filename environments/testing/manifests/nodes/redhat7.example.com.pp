node 'redhat7.example.com' {
	include osadmins
#	Users::Admins <| gid == 1500 |>
	Users::Admins <| state == "absent" |>
	Users::Admins <| state == "present" and gid == 1500 |>
}
