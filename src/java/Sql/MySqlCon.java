package Sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MySqlCon {

    private static Connection con;

    public static boolean initCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse305", "root", "Superhi2");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static void closeCon() {
        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean initCustomer(String orderNumber, String fName,
            String lName, String email, String phone, String address) {
        try {
            String query = "INSERT INTO Customer(OrderNum, FirstName, LastName, Email, Phone, Address)"
                    + " VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, orderNumber);
            preparedStatement.setString(2, fName);
            preparedStatement.setString(3, lName);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, phone);
            preparedStatement.setString(6, address);
            preparedStatement.execute();
        } catch (Exception e) {
            System.err.println("Exception" + e.getMessage());
            return false;
        }
        return true;
    }

    public static boolean initShoppingCart(String orderNumber, double total) {
        try {
            String query = "INSERT INTO ShoppingCart(OrderNum, TotalSum)"
                    + " VALUES (?, ?)";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, orderNumber);
            preparedStatement.setDouble(2, total);
            preparedStatement.execute();
        } catch (Exception e) {
            System.err.println("Exception" + e.getMessage());
            return false;
        }
        return true;
    }

    public static boolean linkCustomerCart() {
        try {
            String query = "UPDATE Customer, ShoppingCart "
                    + "SET SID=ShoppingCart.Id "
                    + "WHERE Customer.OrderNum = ShoppingCart.OrderNum";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.execute();
        } catch (Exception e) {
            System.err.println("Exception" + e.getMessage());
        }
        return true;
    }

    public static boolean FillShoppingCart(String orderNumber, ArrayList<Item> itemList) {
        try {
            int SID = 0;
            ResultSet rs;
            String query = "SELECT SID FROM Customer WHERE OrderNum=?";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, orderNumber);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                SID = rs.getInt(1);
            }
            for (Item item : itemList) {
                if (item.getQuantity() > 0) {
                    query = "INSERT INTO ShoppingCartItem (SID, ArticleID, Quantity, Total) "
                            + "VALUES (?, ?, ?, ?)";
                    preparedStatement = con.prepareStatement(query);
                    preparedStatement.setInt(1, SID);
                    preparedStatement.setString(2, item.getID());
                    preparedStatement.setInt(3, item.getQuantity());
                    preparedStatement.setDouble(4, item.getTotal());
                    preparedStatement.execute();

                    query = "UPDATE Item SET Quantity=Quantity - ? WHERE ArticleID=?";
                    preparedStatement = con.prepareStatement(query);
                    preparedStatement.setInt(1, item.getQuantity());
                    preparedStatement.setString(2, item.getID());
                    preparedStatement.execute();
                }
            }
            query = "UPDATE Inventory SET TotalQuantity=(SELECT sum(Quantity) FROM Item WHERE Item.Type=Inventory.Type) ";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.execute();
        } catch (Exception e) {
            System.err.println("Exception" + e.getMessage());
            return false;
        }
        return true;
    }

    public static boolean postShippingDetails(String orderNum, String address, int fees) {
        try {
            String query = "INSERT INTO Shipping (OrderNum, Address, Type, Fees, Carrier) "
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, orderNum);
            preparedStatement.setString(2, address);
            if (fees == 6) {
                preparedStatement.setString(3, "priority");
            } else {
                preparedStatement.setString(3, "express");
            }
            preparedStatement.setInt(4, fees);
            preparedStatement.setString(5, "UPS");
            preparedStatement.execute();
        } catch (Exception e) {
            System.err.println("Exception" + e.getMessage());
            return false;
        }
        return true;
    }

    public static boolean postPaymentDetails(String fullName, String cardNum,
            String cvc, String expiration, String billingAddress, double paymentTotal) {
        try {
            String query = "INSERT INTO Payment (FullName, CardNum, CVCode, Expiration, BillingAddress, PaymentTotal) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, cardNum);
            preparedStatement.setString(3, cvc);
            preparedStatement.setString(4, expiration);
            preparedStatement.setString(5, billingAddress);
            preparedStatement.setDouble(6, paymentTotal);
            preparedStatement.execute();
        } catch (Exception e) {
            System.err.print("Exception" + e.getMessage());
            return false;
        }
        return true;
    }

    public static boolean checkOrderNum(String orderNumber) {
        try {
            int count = 0;
            String query = "SELECT count(*) FROM Customer WHERE OrderNum = ?";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, orderNumber);
            final ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            if (!(count > 0)) {
                return false;
            }
        } catch (Exception e) {
            System.err.println("Exception" + e.getMessage());
            return false;
        }
        return true;
    }

    public static boolean leaveReview(String ID, String nickname, int rating, String Review) {
        try {
            String query = "INSERT INTO Review (ArticleID, Nickname, Rating, Review) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, ID);
            preparedStatement.setString(2, nickname);
            preparedStatement.setInt(3, rating);
            preparedStatement.setString(4, Review);
            preparedStatement.execute();
        } catch (Exception e) {
            System.err.println("Exception" + e.getMessage());
            return false;
        }
        return true;
    }
}
