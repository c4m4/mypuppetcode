node 'puppetclient.example.com' {
	include osadmins
	Users::Admins <| gid == 1500 |>
}
