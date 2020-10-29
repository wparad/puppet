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
	package{'gnupg2':}
	package{'xfce4-clipman':}
	package{'curl':}
	package{'dconf-editor':}
	# For VSCODE https://code.visualstudio.com/docs/setup/linux
	package{'gvfs-bin':}

	file{'/etc/sysctl.d/10-magic-sysrq.conf':
		ensure => file,
		mode => '0644',
		source => 'puppet:///modules/tools_default/10-magic-sysrq.conf'
	}

	#Files to purge
	package {'popularity-contest': ensure => purged}

	file{'/etc/sudoers':
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0440',
		source => 'puppet:///modules/tools_default/etc/sudoers'
	}

  # Add dvorak layout with german fixes
	file{'/usr/share/X11/xkb/symbols/us':
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0644',
		source => 'puppet:///modules/tools_default/etc/dvorak-keyboard-layout'
	}

	# Remove buttons 8 & 9 from Razor mouse
	# xinput set-button-map 10 1 2 3 4 5 6 7 11 12 10
	file{'/usr/share/X11/xorg.conf.d/70-remap-mouse-keys.conf':
		ensure => file,
		owner => 'root',
		group => 'root',
		mode => '0644',
		source => 'puppet:///modules/tools_default/usr/share/X11/xorg.conf.d/remap-mouse-keys.conf'
	}
}
