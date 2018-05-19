node default{
	class{'tools_default':}
	class{'numlock_fix':}
	Package{ ensure => present, provider => apt}
	package{'software-properties-common':}
	package{'python-software-properties':}
	#SVG Editor for presentations
	package{'dia':}

	#sudo add-apt-repository ppa:phablet-team/tools && sudo apt-get update
	#package{['android-tools-adb', 'android-tools-fastboot']:}

	#Connect to VPN
	package{'network-manager-openconnect':} -> package{'network-manager-openconnect-gnome':}
	package{'network-manager-vpnc':} -> package{'network-manager-vpnc-gnome':}
	package{'network-manager-openvpn':} -> package{'network-manager-openvpn-gnome':}

	#Remote desktop
	#package{'remmina':}

	#Video converting
	package{'mkvtoolnix-gui':}

	#Monitor network traffic
	package{'tcpflow':}

	#Scan Pdf files
	package{'gscan2pdf':}

	#Combine Pdf's
	package{'pdftk':}

	#http://ccrypt.sourceforge.net/
	#http://www.cs.mcgill.ca/~kaleigh/computers/crypto_rijndael.html
	package{'ccrypt':}

	exec{'update apt':
		command => 'apt-get update',
		path => $::path,
		refreshonly => true,
	}
	
	exec{'get latest peerguardian':
		command => 'add-apt-repository ppa:jre-phoenix/ppa -y',
		path => $::path
	}
	~> Exec['update apt']
	-> package{['pgld', 'pglcmd', 'pglgui']:}

	file{'/etc/apt/sources.list.d/google.list':
		ensure => present,
		content => 'deb http://dl.google.com/linux/chrome/deb/ stable main'
	}
	~> exec{'get latest google chrome':
		command => 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ',
		path => $path,
		refreshonly => true
	}
	~> Exec['update apt']
	-> package{'google-chrome-stable':
		install_options => ['--force-yes']
	}

	file{'/etc/apt/sources.list.d/signal-xenial.list':
		ensure => present,
		content => 'deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main'
	}
	~> exec{'get latest Signal':
		command => 'curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -',
		path => $path,
		refreshonly => true
	}
	~> Exec['update apt']
	-> package{'signal-desktop':
		install_options => ['--force-yes']
	}

	#Samba network shares
	package{'cifs-utils':}

#	Fix Key Board (http://askubuntu.com/questions/7190/why-wont-my-xmodmap-file-load-on-login)
#	if [ -f $HOME/.Xmodmap ]; then
#		/usr/bin/xmodmap $HOME/.Xmodmap
#	fi

	package{'vlc':}

	#for drivers for steam video
	package{'libelf-dev':}
	package{'libc6-dev-i386':}
	package{'git':}
	-> users::create_user{'warren':
		email => 'wparad@gmail.com',
		ingroups => ['warren', 'adm', 'cdrom', 'sudo', 'dip', 'plugdev', 'lpadmin', 'sambashare'], #'audio', 'users'
		id => '1000',
	}
	package{'build-essential':}
	package{'autokey-gtk':}

	class{'game_controller':}
	class{'box_share':}

	class{'nodejs':
		user => 'warren'
	}
}
