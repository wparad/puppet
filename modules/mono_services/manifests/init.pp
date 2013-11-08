class mono_services
{
	$service_home="/home/services"
	file {$service_home:
    		ensure => "directory",
		owner  => "root",
    		group  => "root",
		mode   => '0755'
	}

	file {"/alt/deployed_packages":
                ensure => "directory",
                owner  => "root",
                group  => "root",
                mode   => '0777'
        }

	$svn_update = "cd /etc/puppet" #Figure out what to do here && git pull --rebase"
	cron{puppet_update:
		ensure => present,
		command => "$svn_update",
		target => root,
		user => root,
		minute => 0,
	}	

}
