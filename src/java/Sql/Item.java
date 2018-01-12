/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sql;

/**
 *
 * @author billy
 */
public class Item {

    private String articleID;
    private int quantity;
    private double price;

    public Item() {
        articleID = "";
        quantity = 0;
        price = 0;
    }
    
    public void setID(String id) {
        articleID = id;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double cost) {
        this.price = cost;
    }
    
    public String getID() {
        return articleID;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public double getPrice() {
        return price;
    }
    
    public double getTotal() {
        return price * quantity;
    }

}
