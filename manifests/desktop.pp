node default
{
	Package{ ensure => present, provider => apt}

	class{'tools_default':}
	class{'numlock_fix':}
	package{'software-properties-common':}
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
	
  file{'/etc/apt/sources.list.d/peerguardian.list':
		ensure => present,
		content => "deb http://moblock-deb.sourceforge.net/debian stretch main\ndeb-src http://moblock-deb.sourceforge.net/debian stretch main"
	}
        -> exec{'gpg --keyserver keyserver.ubuntu.com --recv-keys C0145138':
               path => $path
	}
	-> exec{'gpg --export --armor C0145138 | sudo apt-key add -':
		path => $path		
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

	exec{'add-apt-repository ppa:daniel-marynicz/filemanager-actions':
		path: => $path
	}
	-> package{'nautilus':}
	-> package{'nautilus-scripts-manager':}
	-> package{'filemanager-actions-nautilus-extension':}

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

	# GUI to configure key bindings
	package{'xbindkeys-config':}

	class{'game_controller':}

	class{'nodejs':
		user => 'warren'
	}
}
