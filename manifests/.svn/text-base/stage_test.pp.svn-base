node default{
#	Stage['main'] -> 
 #       stage {'last':}
#	import 'import.pp'

#	class{'a1': stage => last}
#	class{'a2':}
#	class{'c1':}
#	class{'c2':}
#	class{'c5':, stage => main}

}

class a1{
	notify{'a1':}
}

class a2 inherits a1{
	notify{'a2':}
}


class c1{
	        stage { 'setup':} -> Stage['main'] ->
        stage { 'runtime':} ->
	notify{'hello last': stage => last}
	class{'c1::ca': stage => setup}	
	class{'c1::cb': stage => runtime}	
}

class c1::ca{
	notify{'c1::ca':}
}
class c1::cb{
	notify{'c1::cb':}
}

class c2{
        class{'c2::ca': stage => setup}
        class{'c2::cb': stage => runtime}
}

class c2::ca{
        notify{'c2::ca':}
}
class c2::cb{
        notify{'c2::cb':}
}


class c3{
	
	file{'/etc/temp': ensure => present}	
}

class c4{

	class{'c3': stage => main}
	<- notify{'c4':}

}

class c5{
	notify{'c5':} ->
	class{'c4':}
}
