node default{
	class{'tools_default':}
	Package{ ensure => present, provider => apt}
	package{'software-properties-common':}
	package{'python-software-properties':}
	package{'firefox':}
	exec{'get latest mono':
		command => 'apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF',
		path => $::path
	}
	-> exec{'update apt-repos':
		command => 'echo "deb http://download.mono-project.com/repo/debian wheezy main" >> /etc/apt/sources.list.d/mono-xamarin.list',
		path => $::path
	}
	-> exec{'update apt':
		command => 'apt-get update',
		path => $::path
	}
	-> package{['monodevelop', 'mono-complete', 'fsharp']:}
	package{'geany':}
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

	#Samba setup
	class{'samba':}

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
