define mono_services::service($tar_name)
{
	$t_service_home = "${mono_services::service_home}/${name}"
        file {$t_service_home:
                ensure => "directory",
                owner  => "root",
                group  => "root",
                mode   => '0755'
        }
        -> exec {"tar -xzf /alt/deployed_packages/${tar_name}.tar.gz":
		path => $::path,
                cwd  => $t_service_home,
        }

	-> file{"/etc/init.d/${name}":
		ensure => present,
		owner   => 'root',
        	group   => 'root',
	        mode    => '0641',
	        content => template('mono_services/init.d.erb')
	}
}
