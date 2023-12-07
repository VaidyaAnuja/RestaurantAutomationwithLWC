public with sharing class ControllerClassforApplicationNum {
@AuraEnabled(cacheable=true)
    public static void generateApplicationNo(){
        Decimal newApplicationNo = 0.0;
        List<Application__c> reqrecord = [Select Lead_Ref_Num__c From Application__c Where Lead_Ref_Num__c =: ControllerClassforLeadRefNo.newleadnum];
        Decimal leadrefno = ControllerClassforLeadRefNo.newleadnum.round(System.RoundingMode.DOWN);
        String Initial = String.ValueOf(leadrefno);
        String tobeadded=Initial.substring(Initial.length()-2, Initial.length());
        String FinalAppNo = Initial+tobeadded;
        newApplicationNo = decimal.valueOf(FinalAppNo);
        for(Application__c app: reqrecord){
            app.Application_Num__c = newApplicationNo;
        }
        try{
                update reqrecord;
            }catch(DmlException e) {
                System.debug('An unexpected error has occurred: ' + e.getMessage());
}
        //system.debug([Select Application_Num__c From Application__c Where Lead_Ref_Num__c =: ControllerClassforLeadRefNo.newleadnum]);
        
    }
}