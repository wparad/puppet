node default 
{
	stage{'setup':} -> Stage['main']
	class{'tools_default': stage => 'setup'}
	
	class{'git-server':}
	
	class{'mono_services':}
	-> mono_services::service{'courier':
		#tar_name => "StockEstimator.Service.Main",
		id => '2001'
	}
	
	users::create_user{'warren':
		ingroups => ['warren', 'adm', 'sudo', 'audio', 'video', 'users', 'git', 'deploy'],
		id => '1000',
		email => 'wparad@gmail.com',
		require => Group['deploy']
	}
}
