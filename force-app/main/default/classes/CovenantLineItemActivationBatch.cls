global class CovenantLineItemActivationBatch implements Database.Batchable<sObject>{
    
    public Date TODAY_DATE;
    public static String COVENANT_FILEDS = 'Id,Status__c,CovenantStatus__c,Activation_Date__c';
    
    public CovenantLineItemActivationBatch(Date batchJOBDate){
        Date  todayDateDefault =  Date.today() ;
        TODAY_DATE = batchJOBDate == null ? todayDateDefault : batchJOBDate;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        List<Object> placeholders = new List<Object>{COVENANT_FILEDS};
        String queryString = 'SELECT {0} FROM Covenant_Data__c WHERE CovenantStatus__c =:status AND IsMaster__c = false AND Activation_Date__c<=:todayDate';
        String myQuery = String.format(queryString,placeholders);
        Map<String, Object> varBind = new Map<String, Object>{'status' => 'Draft','todayDate' => TODAY_DATE};
        return Database.getQueryLocatorWithBinds(myQuery,varBind,AccessLevel.SYSTEM_MODE);
    }
    
    global void execute(Database.BatchableContext bc, List<Covenant_Data__c> records){
        for(Covenant_Data__c r : records){
            r.CovenantStatus__c = 'Active';
            r.Status__c = 'Pending Business-Customer Action';
        }
        try{
            System.debug('records ==>'+records);
            update records;  
        }catch(Exception e){
            System.debug('Error while Saving'+e.getMessage());
        }
        
    }
    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}