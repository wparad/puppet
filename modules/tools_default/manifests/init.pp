class tools_default()
{
	file{['/etc/puppetlabs', '/opt/puppetlabs', '/opt/puppetlabs/puppet', '/var/log/puppetlabs', '/var/log/puppetlabs/puppet']:
		ensure => directory,
		mode => '0755',
		owner => root,
		group => root
	}

	package{'bash-completion': ensure => present}
	package{'cron': ensure => present}
	package{'rsyslog': ensure => present}
	package{'nano':}
	package{'curl':}
	package{'dconf-editor':}

	file{'/etc/sysctl.d/10-magic-sysrq.conf':
		ensure => file,
		mode => '0644',
		source => 'puppet:///modules/tools_default/10-magic-sysrq.conf'
	}
}
