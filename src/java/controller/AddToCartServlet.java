/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import VO.CartVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mariane Martins Curi
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/add-to-cart"}, initParams = {
    @WebInitParam(name = "Name", value = "Value")})
public class AddToCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

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
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            ArrayList<CartVO> cartList = new ArrayList<>();

            int id = Integer.parseInt(request.getParameter("id"));
            CartVO cm = new CartVO();
            cm.setId(id);
            cm.setItem_quantidade(1);

            HttpSession session = request.getSession();
            ArrayList<CartVO> cart_list = (ArrayList<CartVO>) session.getAttribute("cart-list");

            if (cart_list == null) {
                cartList.add(cm);
                session.setAttribute("cart-list", cartList);
                response.sendRedirect("cart.jsp");
                //out.println("Sessão criada e adcionada à lista.");
            } else {
                cartList = cart_list;
                boolean exist = false;

                for (CartVO c : cart_list) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<h3 style='color:crimson; text-align: center'>Produto já adicionado ao <a href='cart.jsp'>carrinho.</a></h3>");
                    }
                }

                if (!exist) {
                    cartList.add(cm);
                    response.sendRedirect("cart.jsp");
                    //out.println("Produto(s) adicionado(s):");
                }
            }

            //for (CartVO c : cart_list) {
            //    out.println(c.getId());
            //}
        }
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
