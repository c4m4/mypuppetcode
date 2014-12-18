class apache::pkg ( $pkgname = hiera("pkgs")){
	package { $pkgname:
		  ensure => present,
		}
}

