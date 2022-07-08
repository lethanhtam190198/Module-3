package model;

public class Service {
    private String serviceName;
    private double serviceArea;
    private double serviceCost;
    private int serviceMaxPeople;
    private int serviceRentTypeId;

    public Service() {
    }

    public Service(String serviceName, double serviceArea, double serviceCost, int serviceMaxPeople, int serviceRentTypeId) {
        this.serviceName = serviceName;
        this.serviceArea = serviceArea;
        this.serviceCost = serviceCost;
        this.serviceMaxPeople = serviceMaxPeople;
        this.serviceRentTypeId = serviceRentTypeId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public double getServiceArea() {
        return serviceArea;
    }

    public void setServiceArea(double serviceArea) {
        this.serviceArea = serviceArea;
    }

    public double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public int getServiceMaxPeople() {
        return serviceMaxPeople;
    }

    public void setServiceMaxPeople(int serviceMaxPeople) {
        this.serviceMaxPeople = serviceMaxPeople;
    }

    public int getServiceRentTypeId() {
        return serviceRentTypeId;
    }

    public void setServiceRentTypeId(int serviceRentTypeId) {
        this.serviceRentTypeId = serviceRentTypeId;
    }
}
