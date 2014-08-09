define users::create_user($ingroups, $user_shell = '/bin/bash', $id)
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
        -> file{$user_ssh_dir:
                ensure => directory,
                owner => $name,
                group => $name,
                mode => 0700
        }
        -> file{"${user_ssh_dir}/authorized_keys":
                ensure => file,
                owner => $name,
                group => $name,
                mode => 0700,
                source => "puppet:///modules/users/$name/.ssh/authorized_keys"
        }
        -> file{"${user_home_dir}/.bashrc":
                ensure => file,
                owner => $name,
                group => $name,
                mode => 0644,
                source => "puppet:///modules/users/$name/.bashrc"
        }

}
