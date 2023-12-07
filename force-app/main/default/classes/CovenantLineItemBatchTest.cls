@isTest
public class CovenantLineItemBatchTest {
    static testMethod void t1(){
        List<Covenant_Data__c> lstcovetant = new List<Covenant_Data__c>();
        for(Integer i=0;i<100;i++){
            Covenant_Data__c cd = new Covenant_Data__c();
            cd.Name = 'CD'+i;
            cd.IsMaster__c = false;
            cd.Activation_Date__c = Date.Today();
            cd.Status__c='Processing';
            lstcovetant.add(cd);
        }
        insert lstcovetant;
        Test.startTest();

            CovenantLineItemActivationBatch obj = new CovenantLineItemActivationBatch(Date.Today());
            DataBase.executeBatch(obj); 
            
        Test.stopTest();
    }
}