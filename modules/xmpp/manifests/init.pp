class xmpp()
{
	$passwords = get_passwords()
	$password = $passwords['xmpp']	

	package{'ejabberd':}
	~> exec{"ejabberdctl register admin localhost ${password}":
		path => $::path,
		refreshonly => true
	}
	
	Package['ejabberd']
	-> file{'/etc/ejabberd/ejabberd.cfg':
		ensure => file,
		group => 'ejabberd',
		owner => 'ejabberd',
		mode => '0600',
		source => "puppet:///modules/xmpp/ejabberd.cfg"
	}
}
