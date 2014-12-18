node 'redhat7.example.com' {
	include osadmins
<<<<<<< HEAD
#	Users::Admins <| gid == 1500 |>
	Users::Admins <| state == "absent" |>
	Users::Admins <| state == "present" and gid == 1500 |>
=======
	Users::Admins <| gid == 1500 |>
	Users::Admins <| state == "absent" |>
>>>>>>> 98caa9418a13eb0535614f3da200b051d6d85ffc
}
