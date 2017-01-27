class sublime(){
	file{'/etc/apt/sources.list.d/webupd8team-ubuntu-sublime-text-3-xenial.list':
		ensure => file,
		mode => '0644',
		source => 'puppet:///modules/sublime/webupd8team-ubuntu-sublime-text-3-xenial.list',
	}
	~> exec {'Add PPA key':
		command => 'sudo add-apt-repository ppa:webupd8team/sublime-text-3'
	}
        -> Exec['update apt']
	-> package{'sublime-text-installer':}
}
