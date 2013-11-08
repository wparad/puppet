class user_setup()
{
	user_setup_each{
		user => ['root', 'warren']
	}
}

define user_setup_each($user)
{
	file{"/home/${user}/.forward":
		ensure => present,
		owner  => $user,
                group  => $user,
                mode   => '0755',
		content => 'wparad@gmail.com'
	}
}


