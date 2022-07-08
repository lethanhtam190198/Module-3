package model;

public class Employee {
    private int employeeId;
    private String employeeName;
    private String employeeBirthDay;
    private String employeeIdCard;
    private double employeeSalary;
    private int employeePhone;
    private String employeeEmail;
    private String employeeAddress;
    private int employeePositionId;
    private int employeeEducationDegreeId;
    private int employeeDivisionId;
    private String employeeUserName;


    public Employee() {
    }

    public Employee(int employeeId, String employeeName, String employeeBirthDay, String employeeIdCard, double employeeSalary, int employeePhone, String employeeEmail, String employeeAddress, int employeePositionId, int employeeEducationDegreeId, int employeeDivisionId, String employeeUserName) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeeBirthDay = employeeBirthDay;
        this.employeeIdCard = employeeIdCard;
        this.employeeSalary = employeeSalary;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.employeeAddress = employeeAddress;
        this.employeePositionId = employeePositionId;
        this.employeeEducationDegreeId = employeeEducationDegreeId;
        this.employeeDivisionId = employeeDivisionId;
        this.employeeUserName = employeeUserName;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeBirthDay() {
        return employeeBirthDay;
    }

    public void setEmployeeBirthDay(String employeeBirthDay) {
        this.employeeBirthDay = employeeBirthDay;
    }

    public String getEmployeeIdCard() {
        return employeeIdCard;
    }

    public void setEmployeeIdCard(String employeeIdCard) {
        this.employeeIdCard = employeeIdCard;
    }

    public double getEmployeeSalary() {
        return employeeSalary;
    }

    public void setEmployeeSalary(double employeeSalary) {
        this.employeeSalary = employeeSalary;
    }

    public int getEmployeePhone() {
        return employeePhone;
    }

    public void setEmployeePhone(int employeePhone) {
        this.employeePhone = employeePhone;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }

    public String getEmployeeAddress() {
        return employeeAddress;
    }

    public void setEmployeeAddress(String employeeAddress) {
        this.employeeAddress = employeeAddress;
    }

    public int getEmployeePositionId() {
        return employeePositionId;
    }

    public void setEmployeePositionId(int employeePositionId) {
        this.employeePositionId = employeePositionId;
    }

    public int getEmployeeEducationDegreeId() {
        return employeeEducationDegreeId;
    }

    public void setEmployeeEducationDegreeId(int employeeEducationDegreeId) {
        this.employeeEducationDegreeId = employeeEducationDegreeId;
    }

    public int getEmployeeDivisionId() {
        return employeeDivisionId;
    }

    public void setEmployeeDivisionId(int employeeDivisionId) {
        this.employeeDivisionId = employeeDivisionId;
    }

    public String getEmployeeUserName() {
        return employeeUserName;
    }

    public void setEmployeeUserName(String employeeUserName) {
        this.employeeUserName = employeeUserName;
    }
}
