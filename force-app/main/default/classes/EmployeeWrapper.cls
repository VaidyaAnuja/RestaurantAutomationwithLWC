public class EmployeeWrapper {
    public class Employee{
        public String Name;
        public String Code;
        public String City;
    }
    public Employee employee;
    public static String getEmployeeDetails(String empId){
        EmployeeWrapper newEmp = new EmployeeWrapper();
        newEmp.employee = new EmployeeWrapper.employee();
        Employee__c emp = [SELECT Id, Name, Employee_Code__c, City__c FROM Employee__c LIMIT 1];
        newEmp.employee.Name = emp.Name;
        //newEmp.employee.Age = emp.Age__c;
        newEmp.employee.City = emp.City__c;
        newEmp.employee.Code = emp.Employee_Code__c;
        //newEmp.employee.AccountNo = emp.Account_No__c;
        //System.debug(newEmp);
        return System.JSON.serialize(newEmp);
        //return (newEmp.employee.Branch); 
        //return EmployeeWrapper.parse(System.JSON.serialize(newEmp));
        
    }
    public static EmployeeWrapper parse(String json){
        return (EmployeeWrapper)System.JSON.deserialize(json, EmployeeWrapper.class);
    }
}