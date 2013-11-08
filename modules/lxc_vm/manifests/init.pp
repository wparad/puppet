class lxc_vm()
{
	$packages = ['language-pack-en', 
			'aptitude', 
			'ppp', 
			'dialog',
			'openssh-server',
			'iproute',
			'iptables',
			'dnsutils',
			'syslog-ng',
			'sudo',
			'logrotate',
			'cron']
	package{ $packages : ensure => present}
	
}
