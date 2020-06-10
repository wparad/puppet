class ssh_config()
{
	file{"/etc/ssh/sshd_config":
		ensure => file,
		owner => $name,
		group => $name,
		mode => '0640',
		source => "puppet:///modules/ssh_config/sshd_config"
	}

	package{'fail2ban':}
	-> file{'/etc/fail2ban/jail.local':
		ensure => 'file',
		owner => root,
		group => root,
		mode => '0644',
		source => "puppet:///modules/ssh_config/jail.local"
	}
}
