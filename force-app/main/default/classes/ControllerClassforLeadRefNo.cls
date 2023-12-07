public with sharing class ControllerClassforLeadRefNo {
    public static decimal newleadnum = 0.0;
    @AuraEnabled(cacheable=true)
    
    public static void getDetails(String fName, String mName, String lName, String mNum){
       
        if(fName != null && mName != null && lName != null && mNum != null){
         List<Application__c> LeadRefNum = [Select Lead_Ref_Num__c From Application__c Order By Lead_Ref_Num__c Desc Nulls Last];
            if (LeadRefNum.isEmpty()){
         		newleadnum = 600000.0;
            }
            else{
                newleadnum = LeadRefNum[0].Lead_Ref_Num__c + 1;
            }
            Application__c newapp = new Application__c(Name=fName, Middle_Name__c=mName, Last_Name__c=lName, Contact__c=mNum,Lead_Ref_Num__c=newleadnum);
            try{
                insert newapp;
            }catch(DmlException e) {
    System.debug('An unexpected error has occurred: ' + e.getMessage());
}
            ControllerClassforApplicationNum.generateApplicationNo();
         
        }
    }
}