node default 
{
	Package{ ensure => present, provider => apt}

	stage{'setup':} -> Stage['main']
	class{'tools_default': stage => 'setup'}
	
	class{'git-server':}
	users::create_user{'warren':
		ingroups => ['warren', 'adm', 'sudo', 'audio', 'video', 'users', 'git'],
		id => '1000',
		email => 'wparad@gmail.com'
	}
	include custom_scripts
	class{'ssh_config':}
}
