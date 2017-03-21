class numlock_fix() {
	package{'numlockx':}
	-> file{['/usr/share/lightdm', '/usr/share/lightdm/lightdm.conf.d']:
    	ensure => directory,
    	mode => '0755'
    }
    -> file { '/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf':
   		ensure => present,
		mode => '0755',
		owner => root,
		group => root,
		source => 'puppet:///modules/numlock_fix/50-unity-greeter.conf'
	}
    -> file { '/etc/default/console-setup':
   		ensure => present,
		mode => '0755',
		owner => root,
		group => root,
		source => 'puppet:///modules/numlock_fix/console-setup'
	}
}
