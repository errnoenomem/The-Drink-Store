package Sql;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DatabaseServlet", urlPatterns = {"/DatabaseServlet"})
public class DatabaseServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();

            String orderNumber = (String) session.getAttribute("sid");
            String fName = (String) session.getAttribute("firstName");
            String lName = (String) session.getAttribute("lastName");
            String email = (String) session.getAttribute("email");
            String phone = (String) session.getAttribute("phone");
            String address = (String) session.getAttribute("address") + ", " + (String) session.getAttribute("city")
                    + " " + (String) session.getAttribute("state") + ", " + (String) session.getAttribute("zip");
            double total = (double) session.getAttribute("orderTotal");

            if (session.getAttribute("itemList") == null) {
                out.println("ERROR SESSION IS GONE!!!");
            } else {
                if (!MySqlCon.initCon()) {
                    out.println("connection failed to init");
                }
                if (!MySqlCon.initCustomer(orderNumber, fName, lName, email, phone, address)) {
                    out.println("customer failed to init");
                }
                if (!MySqlCon.initShoppingCart(orderNumber, total)) {
                    out.println("shopping cart failed to init");
                }
                if (!MySqlCon.linkCustomerCart()) {
                    out.println("failed to link");
                }
                if (!MySqlCon.FillShoppingCart(orderNumber, (ArrayList) session.getAttribute("itemList"))) {
                    out.println("failed to fill shopping cart");
                }
                if (!MySqlCon.postShippingDetails(orderNumber, address, (int) session.getAttribute("fees"))) {
                    out.println("failed to update shipping");
                }
                if (!MySqlCon.postPaymentDetails((String) session.getAttribute("cardName"),
                        (String) session.getAttribute("cardNumber"), (String) session.getAttribute("cvc"),
                        (String) session.getAttribute("expirationDate"), (String) session.getAttribute("billingAddress"),
                        (double) session.getAttribute("orderTotal"))) {
                    out.println("failed to update payment");
                }
                MySqlCon.closeCon();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
