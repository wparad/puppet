node default{
	#Mono Web server
	package{'mono-complete':}
	class{'services':}
}


class services
{
	class{'mono_services':}
	->
	mono_services::service{"StockEstimator":
		tar_name => "StockEstimator.Service.Main"
	}		
}
