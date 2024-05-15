package br.com.qualiset.model;

public class Product {

    private String id;
    private String name;
    private double price;
    private String imagem;

    public Product(String id, String name, double price){
        this.id = id;
        this.name = name;
        this.price = price;
    }
    public Product(String id, String name, double price, String image){
        this.id = id;
        this.name = name;
        this.price = price;
        this.imagem = image;
    }

    public String getName() {
        return name;
    }

    public double getPrice(){
        return price;
    }


    public String getId() {
        return id;
    }

    public String getImagem() {
        return imagem;
    }
}