package Sql;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String cardName = request.getParameter("cardName");
            String cardNumber = request.getParameter("cardNumber");
            String CVC = request.getParameter("cvc");
            String month = request.getParameter("month");
            String year = request.getParameter("year");
            String billingAddress = request.getParameter("billingAddress");
            String billingCity = request.getParameter("billingCity");
            String billingState = request.getParameter("billingState");
            String billingZip = request.getParameter("billingZip");
            String expirationDate = month + "/" + year;
            String fullBillingAddress = billingAddress + ", " + billingCity + " " + billingState + ", " + billingZip;

            HttpSession session = request.getSession();

            if (session.getAttribute("itemList") == null) {
                out.println("session is null");
            } else {
                session.setAttribute("cardName", cardName);
                session.setAttribute("cardNumber", cardNumber);
                session.setAttribute("cvc", CVC);
                session.setAttribute("billingAddress", fullBillingAddress);
                session.setAttribute("expirationDate", expirationDate);
                out.println("session is not null");
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
