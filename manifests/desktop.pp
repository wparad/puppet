node default{
#	class{'puppetlabs-stdlib':}
	class{'tools_default':}
	Package{ ensure => present, provider => apt}
	package{'software-properties-common':}
	package{'python-software-properties':}
	package{'firefox':}
	package{'monodevelop':}
	package{'geany': }
	package{'mono-complete':}
	package{'scrot':}
	package{'vlc':}
	package{'chromium-browser':}

	#for drivers for steam video
	package{'libelf-dev':}
	package{'libc6-dev-i386':}
	package{'git':}
	package{'build-essential':}
	package{'xfce4-mixer':}
	package{'pavucontrol':}
	package{'autokey-gtk':}
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
#	
#	vlc setup
#	file{'/etc/vlc/lua/http/.hosts'
#		ensure => present,
#		owner  => "root"
#		group  => "root",
#               mode   => 755,
#		content => 'add in the updated host value'
#	}
#
#
#
#
}
