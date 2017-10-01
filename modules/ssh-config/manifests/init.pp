class ssh_config()
{
	file{"/etc/ssh/sshd_config":
                ensure => file,
                owner => $name,
                group => $name,
                mode => '0640',
                source => "puppet:///modules/ssh_config/sshd_config"
        }
}
