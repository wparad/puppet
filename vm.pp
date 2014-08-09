node default 
{
	package{'nano':}
	-> package{'bash-completion':}
	-> class{'git-server':}
	-> class{'users':
}
}
