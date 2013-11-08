node default{
#	class{'puppetlabs-stdlib':}
	Package{ ensure => present, provider => apt}
	package{'firefox':}
	package{'monodevelop':}
	package{'geany': }
	package{'mono-complete':}
	package{'scrot':}

	#for drivers for steam video
	package{'libelf-dev':}
	package{'libc6-dev-i386':}
	package{'git':}
	package{'build-essential':}
#	file{"xfce hide_unhide app bar":
#		ensure => present,
#		content =>
#	}



	#Setup so that packages can be created on this machine
	file {["/alt", "/alt/deployed_packages"]:
                ensure => "directory",
                owner  => "root",
                group  => "root",
                mode   => 777
        }



}
