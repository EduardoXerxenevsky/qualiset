package br.com.qualiset.model;

public class Affiliate {
    private int id;
    private String name;
    private String email;
    private String phone;
    private int followers;
    private String coupon;
    private double discount;

    public Affiliate(String name, String email, String phone, int followers, String coupon, double discount) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.followers = followers;
        this.coupon = coupon;
        this.discount = discount;
    }

    public Affiliate(int id, String name, String email, String phone, int followers, String coupon, double discount) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.followers = followers;
        this.coupon = coupon;
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getFollowers() {
        return followers;
    }

    public void setFollowers(int followers) {
        this.followers = followers;
    }

    public String getCoupon() {
        return coupon;
    }

    public void setCoupon(String coupon) {
        this.coupon = coupon;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }
}
