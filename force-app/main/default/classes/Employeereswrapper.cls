@RestResource(urlMapping='/Employeereswrapper/*')
    global with sharing class Employeereswrapper {
        @HttpGet
        global static String doGet() {
            RestRequest req = RestContext.request;
            String empId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
            return EmployeeWrapper.getEmployeeDetails(empId);
        }
    }