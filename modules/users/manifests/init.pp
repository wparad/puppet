class users
{
        create_user{'warren':
                ingroups => ['warren', 'adm', 'sudo', 'audio', 'video', 'users', 'git'],
                id => '1000'
        }
	-> file{"/home/warren/.forward":
                ensure => present,
                owner  => warren,
                group  => warren,
                mode   => '0755',
                content => 'wparad@gmail.com'
        }

}
