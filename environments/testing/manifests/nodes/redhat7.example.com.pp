node 'redhat7.example.com' {
	include osadmins
	Users::Admins <| gid == 1500 |>
}
