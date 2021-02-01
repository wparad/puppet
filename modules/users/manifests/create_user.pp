define users::create_user($ingroups, $user_shell = '/bin/bash', $id, $email = 'no-reply@gmail.com')
{
	$user_home_dir = "/home/$name"
	group{$name:
		ensure => present,
		gid => $id
	}

	-> user{$name:
		ensure => present,
		uid => $id,
		gid => $name,
		groups => $ingroups,
		membership => minimum,
		shell => $user_shell,
		home => $user_home_dir,
		require => Group[$name]
	}

	$user_ssh_dir = "${user_home_dir}/.ssh"
	exec {"$name homedir":
		command => "/bin/cp -R /etc/skel $user_home_dir; /bin/chown -R ${name}:${name} ${user_home_dir}",
		creates => $user_home_dir,
		require => User[$name]
	}
	if $user_shell != '/bin/false' {
		Exec["$name homedir"]
		-> file{$user_ssh_dir:
			ensure => directory,
			owner => $name,
			group => $name,
			mode => '0700'
		}
		-> file{"${user_ssh_dir}/authorized_keys":
			ensure => file,
			owner => $name,
			group => $name,
			mode => '0700',
			source => "puppet:///modules/users/$name/.ssh/authorized_keys"
		}
		-> file{"${user_home_dir}/.bashrc":
			ensure => file,
			owner => $name,
			group => $name,
			mode => '0644',
			source => "puppet:///modules/users/$name/.bashrc"
		}
		-> file{"${user_home_dir}/.gitconfig":
			ensure => file,
			owner => $name,
			group => $name,
			mode => '0640',
			source => "puppet:///modules/users/$name/.gitconfig"
		}
		-> file{"${user_home_dir}/.forward":
			ensure => present,
			owner => $name,
			group => $name,
			mode   => '0755',
			content => $email
		}
		-> file{["${user_home_dir}/.config", "${user_home_dir}/.config/Code", "${user_home_dir}/.config/Code/User"]:
			ensure => directory,
			owner => $name,
			group => $name,
			mode => '0755'
    		}
		-> file{"${user_home_dir}/.config/Code/User/settings.json":
			ensure => present,
			owner => $name,
			group => $name,
			mode   => '0664',
			source => "puppet:///modules/users/$name/.config/Code/User/settings.json"
		}
		# -> file{"${user_home_dir}/.Xkbmap":
		# 	ensure => present,
		# 	owner => $name,
		# 	group => $name,
		# 	mode   => '0664',
		# 	source => "puppet:///modules/users/$name/.Xkbmap"
		# }
		-> file{"${user_home_dir}/.Xmodmap":
			ensure => present,
			owner => $name,
			group => $name,
			mode   => '0664',
			source => "puppet:///modules/users/$name/.Xmodmap"
		}
		-> file{"${user_home_dir}/.xbindkeysrc":
			ensure => present,
			owner => $name,
			group => $name,
			mode   => '0664',
			source => "puppet:///modules/users/$name/.xbindkeysrc"
		}
	}
}
