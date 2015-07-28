class samba()
{
        package{'samba':}
        -> package{'cifs-utils':}
	-> file{'/etc/samaba/smb.conf':
	        ensure => 'file',
                owner => root,
                group => root,
                mode => '0644',
                source => "puppet:///modules/samba/smb.conf"
        }

}
