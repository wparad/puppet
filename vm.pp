node default 
{
	package{'nano':}
	
	group{'warren':
		ensure => present,
		gid => '1000'
	}
	-> user{'warren':
		ensure => present,
		uid => '1000',
		gid => "warren",
   		groups => ['warren', 'adm', 'sudo', 'audio', 'video', 'users'],
	    	membership => minimum,
	    	shell => "/bin/bash",
    		home => "/home/warren",
    		require => Group['warren']
  	}

	-> exec {"warren homedir":
    		command => "/bin/cp -R /etc/skel /home/warren; /bin/chown -R warren:warren /home/warren",
    		creates => "/home/warren",
    		require => User['warren']
  	}
}
