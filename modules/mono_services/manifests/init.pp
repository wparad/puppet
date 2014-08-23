class mono_services($deploy_id = '2000')
{
	package{'mono-complete':}
	$package_repository = '/package-repository'
	group{'deploy':
		ensure => present,
		gid => $deploy_id
    }
	-> file {$package_repository:
		ensure => 'directory',
		owner  => 'root',
		group  => 'deploy',
		mode   => '0774'
    }
}
