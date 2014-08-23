define mono_services::service($tar_name, $id)
{
	$t_service_home = "/home/${name}"
	users::create_user{$name:
		ingroups => [$name],
		user_shell => '/bin/false',
		id => $id
	}
	-> exec {"tar -xzf ${package_repository}/${tar_name}.tar.gz":
		path => $::path,
		cwd  => $t_service_home
	}

	-> file{"/etc/init.d/${name}":
		ensure => present,
		owner   => $name,
        group   => $name,
	    mode    => '0640',
	    content => template('mono_services/init.d.erb')
	}
}
