include users

class osadmins {
	@users::admins { "wzqbf1": 
			name => "wzqbf1",
			uid => 1700,
			gid => 1500,
			shell => "/bin/bash",
			state => hiera("wzqbf1"),
			}
       @users::admins { "enisys":
                        name => "enisys",
                        uid => 1701,
                        gid => 1500,
                        shell => "/bin/bash",
			state => hiera("enisys"),
                        }
       @users::admins { "rhadmin":
                        name => "rhadmin",
                        uid => 1702,
                        gid => 1500,
                        shell => "/bin/bash",
			state => hiera("rhadmin"),
                        }
       @users::admins { "silvia":
                        name => "silvia",
                        uid => 1900,
                        gid => 1500,
                        shell => "/bin/bash",
			state => hiera("silvia"),
                        }
}
