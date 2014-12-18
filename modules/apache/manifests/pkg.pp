class apache::pkg ( $pkgname = hiera("pkgs")){
	package { $pkgname:
		  ensure => present,
		}
}
<<<<<<< HEAD

=======
>>>>>>> 98caa9418a13eb0535614f3da200b051d6d85ffc
