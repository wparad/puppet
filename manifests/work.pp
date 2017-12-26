node default{
	class{'tools_default':}
	Package{ ensure => present, provider => apt}
	package{'software-properties-common':}
	#Remote desk$top
	#package{'remmina':}

	#mount share files
	package{'gigolo':}
	#Monitor network traffic
	package{'tcpflow':}
	#office documents
	package{'libreoffice':}
	#Scan Pdf files
	package{'gscan2pdf':}
	#Combine Pdf's
	package{'pdftk':}
	
	#Samba network shares
	package{'cifs-utils':}

	exec{'update apt':
		command => 'apt-get update',
		path => $::path,
		refreshonly => true,
	}

	#Take screen shots
	package{'scrot':}
	package{'vlc':}
	
	#Git
	package{'git':}

	package{'autokey-gtk':}
	class{'box_share':}

	class{'nodejs':
		user => 'warren'
	}
}
