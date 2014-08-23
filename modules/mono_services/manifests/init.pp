class mono_services
{
	package{'mono-complete':}
	$package_repository = '/package-repository'
	group{'deploy':
		ensure => present,
		gid => '2000'
    }
	-> file {$package_repository:
		ensure => 'directory',
		owner  => 'root',
		group  => 'deploy',
		mode   => '0774'
    }
}
