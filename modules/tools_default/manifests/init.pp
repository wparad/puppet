class tools_default()
{
	package{'bash-completion': ensure => present}
	package{'cron': ensure => present}
	package{'rsyslog': ensure => present}
	package{'nano':}
}
