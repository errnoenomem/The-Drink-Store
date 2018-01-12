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

@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    ArrayList<Item> list;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int quantity = 0;
            int currRow = Integer.parseInt(request.getParameter("rowNum"));
            HttpSession session = request.getSession();

            if (session.getAttribute("itemList") == null) {
                list = new ArrayList();
                Item[] item = new Item[9];
                for (int i = 0; i < 9; i++) {
                    item[i] = new Item();
                    item[i].setID(request.getParameter("ID" + (i + 1)));
                    item[i].setPrice(Double.parseDouble(request.getParameter("p" + (i + 1))));
                    list.add(item[i]);
                }
                quantity = Integer.parseInt(request.getParameter("q" + currRow));
                list.get(currRow - 1).setQuantity(quantity);
                session.setAttribute("itemList", list);
            } else {
                list = (ArrayList) session.getAttribute("itemList");
                quantity = Integer.parseInt(request.getParameter("q" + currRow));
                list.get(currRow - 1).setQuantity(quantity);
            }
            int counter = 0;
            double total = 0;
            for (Item item : list) {
                counter += item.getQuantity();
                total += (item.getQuantity() * item.getPrice());
            }
            session.setAttribute("total", total);
            session.setAttribute("itemTotal", counter);
            session.setAttribute("sid", session.getId());
            out.println(counter);
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
