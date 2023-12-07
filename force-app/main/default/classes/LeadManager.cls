global class LeadManager {
    webservice static string createdNewLead(string leadFirstName,string leadLastName,string leadCompanyName,string leadEmail,string leadPhone){
        try{
        Lead ld = new Lead();
        ld.FirstName=leadFirstName;
        ld.LastName=leadLastName;
        ld.Company=leadCompanyName;
        ld.Email=leadEmail;
        ld.Phone=leadPhone;
        insert ld;
        return ld.id;
        }
        catch(exception ex){
            return 'Error during process';
        }
    }
}