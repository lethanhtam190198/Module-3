package model;

public class Customer {
    private int customer_id;
    private int customer_type_id;
    private String customerName;
    private String customerBirthDay;
    private String customerGender;
    private String customer_id_card;
    private String customer_Phone;
    private String customer_email;
    private String customer_address;

    public Customer() {
    }



    public Customer(int customer_id, int customer_type_id, String customerName, String customerBirthDay, String customerGender, String customer_id_card, String customer_Phone, String customer_email, String customer_address) {
        this.customer_id = customer_id;
        this.customer_type_id= customer_type_id;
        this.customerName = customerName;
        this.customerBirthDay = customerBirthDay;
        this.customerGender = customerGender;
        this.customer_id_card = customer_id_card;
        this.customer_Phone = customer_Phone;
        this.customer_email = customer_email;
        this.customer_address = customer_address;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getCustomer_type_id() {
        return customer_type_id;
    }

    public void setCustomer_type_id(int customer_type_id) {
        this.customer_type_id = customer_type_id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerBirthDay() {
        return customerBirthDay;
    }

    public void setCustomerBirthDay(String customerBirthDay) {
        this.customerBirthDay = customerBirthDay;
    }

    public String getCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(String customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomer_id_card() {
        return customer_id_card;
    }

    public void setCustomer_id_card(String customer_id_card) {
        this.customer_id_card = customer_id_card;
    }

    public String getCustomer_Phone() {
        return customer_Phone;
    }

    public void setCustomer_Phone(String customer_Phone) {
        this.customer_Phone = customer_Phone;
    }

    public String getCustomer_email() {
        return customer_email;
    }

    public void setCustomer_email(String customer_email) {
        this.customer_email = customer_email;
    }

    public String getCustomer_address() {
        return customer_address;
    }

    public void setCustomer_address(String customer_address) {
        this.customer_address = customer_address;
    }
}
