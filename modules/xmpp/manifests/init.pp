class xmpp()
{
	$passwords = get_passwords()
	$password = $passwords['xmpp']	

	package{'ejabberd':}
	~> exec{"ejabberdctl register admin localhost ${password}":
		path => $::path,
		refreshonly => true
	}

}
