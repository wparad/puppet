class custom_scripts()
{
	$passwords = get_passwords()
	$gmail_password = $passwords['gmail']
	
	file{'/etc/custom_scripts':
		ensure => directory,
		mode => '0755'
	}
	-> file{'/etc/custom_scripts/get_ip_address.sh':
		ensure => present,
		mode => '0755',
		owner => root,
		group => root,
		source => 'puppet:///modules/custom_scripts/get_ip_address.sh'
	}
	-> cron{ 'send ipaddress changes':
		ensure => present,
		command => '/etc/custom_scripts/get_ip_address.sh',
		minute => 0,
		hour => 0,
		user => warren
	}
	-> package{'ssmtp': ensure => present }
	-> file{'/etc/ssmtp/ssmtp.conf':
		ensure => present,
		mode => '0644',
		owner => root,
		group => root,
		content => template('custom_scripts/ssmtp.conf.erb')
	}
}
