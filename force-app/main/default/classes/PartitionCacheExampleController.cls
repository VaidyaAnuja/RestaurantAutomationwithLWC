public with sharing class PartitionCacheExampleController
{
	@AuraEnabled
	public static void storeDataController(){
		Contact cont = [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE Id = '0034R00003oGP8PQAW' LIMIT 1];
		Cache.Session.put('ContactFound', cont);
		Cache.Session.put('local.TacoCat.ContactFound', cont);
	}

	@AuraEnabled
	public static Contact retrieveDataCacheController(){
        system.debug(Cache.Session.get('local.TacoCat.ContactFound'));
		return (Contact) Cache.Session.get('ContactFound');
		
		
	}

	@AuraEnabled
	public static Contact retrieveDataSOQLController(){
		system.debug([SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE Id = '0032w00000tMbWZAA0' LIMIT 1]);
		return [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE Id = '0034R00003oGP8PQAW' LIMIT 1];
	}
}