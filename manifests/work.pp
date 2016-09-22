node default{
	package{'bash-completion': ensure => present}
	package{'cron': ensure => present}
	package{'rsyslog': ensure => present}
	package{'nano':}
	Package{ ensure => present, provider => apt}
	package{'software-properties-common':}
	#Remote desktop
	package{'remmina':}

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

	class{'sublime':}	

	#Take screen shots
	package{'scrot':}
	package{'vlc':}
	
	#Git
	package{'git':}
	package{'meld':}

	package{'autokey-gtk':}
}
