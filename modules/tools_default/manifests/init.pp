class tools_default()
{
	file{['/etc/puppetlabs', '/opt/puppetlabs', '/opt/puppetlabs/puppet', '/var/log/puppetlabs', '/var/log/puppetlabs/puppet']:
		ensure => directory,
		mode => '0755',
		user => root
	}

	package{'bash-completion': ensure => present}
	package{'cron': ensure => present}
	package{'rsyslog': ensure => present}
	package{'nano':}
}
