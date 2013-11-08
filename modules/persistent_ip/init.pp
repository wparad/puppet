class persistent_ip()
{
	file{'getIPAddress.sh':
		ensure => present,
		source => "//puppet/files/getIPAddress.sh",
		path => "/etc/custom_scripts/getIPAddress.sh"
	}
	cron{'getIPAddress':
		ensure => present,
		"0 * * * * /etc/custom_scripts/getIPAddress.sh"
	}

	package{'bsd-mailx':}
	package{'sendmail':}

}
