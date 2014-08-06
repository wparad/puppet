node default 
{
	package{'nano':}
	-> package{'bash-completion':}
	-> class{'users':}
}
