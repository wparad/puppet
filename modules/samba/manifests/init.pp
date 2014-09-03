class samba()
{
        package{'samba':}
        -> package{'cifs-utils':}
	-> exec{'([ -f /etc/samba/smb.conf ] && ! [ -f /etc/samba/smb.conf.bak ]) && mv /etc/samba/smb.conf /etc/samba/smb.conf smb.conf.bak':
		path => $::path
	}
	-> file{'/etc/samaba/smb.conf'
	        ensure => file,
                owner => root,
                group => root,
                mode => 0644,
                source => "puppet:///modules/samba/smb.conf"
        }

}
