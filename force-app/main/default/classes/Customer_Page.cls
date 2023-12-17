public with sharing class Customer_Page {
    public Customer_Page() {

    }
    @AuraEnabled(cacheable=true)

    public static List<StaticImages__mdt> getStarters() {

        return [SELECT Id, ImageName__c, Section__c, MasterLabel FROM StaticImages__mdt where Section__c='Starters'];

    }
}