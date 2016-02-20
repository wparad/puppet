node default{
	class{'tools_default':}
	Package{ ensure => present, provider => apt}
	package{'software-properties-common':}
	#package{'python-software-properties':}
	#Connect to VPN
	package{'network-manager-openconnect-gnome':}
	#Remote desktop
	package{'remmina':}

	#Monitor network traffic
	package{'tcpflow':}
	#office documents
	package{'libreoffice':}
	#Scan Pdf files
	package{'gscan2pdf':}
	#Combine Pdf's
	package{'pdftk':}

	#ISO to USB
	#sudo add-apt-repository ppa:gezakovacs/ppa
	package{'unetbootin':}
	exec{'get latest mono':
		command => 'apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF',
		path => $::path
	}
	-> file{'/etc/apt/sources.list.d/mono-xamarin.list':
		ensure => present,
		content => 'deb http://download.mono-project.com/repo/debian wheezy main'
	}
	-> exec{'get latest peerguardian':
		command => 'add-apt-repository ppa:jre-phoenix/ppa -y',
		path => $::path
	}
#	-> file{'/etc/apt/sources.list.d/peerguardian.list':
#		ensure => present,
#		content => 'deb http://moblock-deb.sourceforge.net/debian wheezy main'
#	}
	-> exec{'update apt':
		command => 'apt-get update',
		path => $::path
	}
	-> package{['pgld', 'pglcmd', 'pglgui']:}
	-> package{['monodevelop']:}
	#-> package{['mono-complete', 'fsharp']:}

	file{'/etc/apt/sources.list.d/google.list':
		ensure => present,
		content => 'deb http://dl.google.com/linux/chrome/deb/ stable main'
	}
	-> exec{'get latest google chrome':
		command => 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ',
		path => $path,
		refreshonly => true
	}
	-> Exec['update apt']
	-> package{'google-chrome-stable':
		install_options => ['--force-yes']
	}

	package{'scrot':}
	package{'vlc':}
	package{'chromium-browser':}
	#for drivers for steam video
	package{'libelf-dev':}
	package{'libc6-dev-i386':}
	package{'git':}
	-> users::create_user{'warren':
		email => 'wparad@gmail.com',
		ingroups => ['warren', 'adm', 'cdrom', 'sudo', 'dip', 'plugdev', 'lpadmin', 'sambashare'],
		id => '1000',
	}
	package{'build-essential':}
	package{'xfce4-mixer':}
	package{'pavucontrol':}
	package{'autokey-gtk':}
#	file{"xfce hide_unhide app bar":
#		ensure => present,
#		content =>
#	}

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
