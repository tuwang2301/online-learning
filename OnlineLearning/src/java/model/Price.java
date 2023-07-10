/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DAT
 */
public class Price {
    private int PackageId;
    private String PackageName;
    private int Duration;
    private boolean Status;
    private double ListPrice;
    private double SalePrice;
    private String Description;

    public Price() {
    }

    public Price(int PackageId, String PackageName, int Duration, boolean Status, double ListPrice, double SalePrice, String Description) {
        this.PackageId = PackageId;
        this.PackageName = PackageName;
        this.Duration = Duration;
        this.Status = Status;
        this.ListPrice = ListPrice;
        this.SalePrice = SalePrice;
        this.Description = Description;
    }

    public int getPackageId() {
        return PackageId;
    }

    public void setPackageId(int PackageId) {
        this.PackageId = PackageId;
    }

    public String getPackageName() {
        return PackageName;
    }

    public void setPackageName(String PackageName) {
        this.PackageName = PackageName;
    }

    public int getDuration() {
        return Duration;
    }

    public void setDuration(int Duration) {
        this.Duration = Duration;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public double getListPrice() {
        return ListPrice;
    }

    public void setListPrice(double ListPrice) {
        this.ListPrice = ListPrice;
    }

    public double getSalePrice() {
        return SalePrice;
    }

    public void setSalePrice(double SalePrice) {
        this.SalePrice = SalePrice;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    @Override
    public String toString() {
        return "Price{" + "PackageId=" + PackageId + ", PackageName=" + PackageName + ", Duration=" + Duration + ", Status=" + Status + ", ListPrice=" + ListPrice + ", SalePrice=" + SalePrice + ", Description=" + Description + '}';
    }
    
    
    
}
