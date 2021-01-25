class squid_proxy()
{
	package{'squid3':
		ensure => installed,
	}

	file{'/etc/squid.passwd':
		ensure => present,
	}
	fail('Setup the password file that ts specified in the conf file')

	file {'/etc/squid3/squid.conf':
		ensure => present,
		owner  => "root",
		group  => "root",
		mode   => '0777',
		source => "puppet:///modules/squid_proxy/squid.conf"
	}
}

