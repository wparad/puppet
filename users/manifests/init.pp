class users
{
	#warren
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

        $home_dir = "/home/warren"
        $ssh_dir = "${home_dir}/.ssh"
        exec {"warren homedir":
                command => "/bin/cp -R /etc/skel /home/warren; /bin/chown -R warren:warren /home/warren",
                creates => "/home/warren",
                require => User['warren']
        }
        -> file{$ssh_dir:
                ensure => directory,
                owner => warren,
                group => warren,
                mode => 0700
        }
	-> file{"${ssh_dir}/id_rsa.pub":
                ensure => file,
                owner => warren,
                group => warren,
                mode => 0700,
                source => "puppet:///modules/users/warren/.ssh/id_rsa.pub"
        }
}
