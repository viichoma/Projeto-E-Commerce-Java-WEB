/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import DAO.UsuarioDAO;
import VO.UsuarioVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author unico
 */
public class LoginController extends HttpServlet {

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
    // Checar função que deve ocorrer ao dar submit
    String acao = request.getParameter("acao");
        if (acao != null) {
        switch (acao) {
            case "logar":
                LoginUser(request, response);
                break;
            case "register":
                RegUser(request, response);
                break;
            default:
                break;
                      }
                         }
    }
    // Função de Login de usuario
     protected void LoginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try (PrintWriter out = response.getWriter()) {
                UsuarioVO user = new UsuarioVO();
                user.setEmail(request.getParameter("email"));
                user.setPassword(request.getParameter("senha"));
                //Pegar os dados que serão checados no BD para logar
                UsuarioDAO uDAO = new UsuarioDAO();
                String email = user.getEmail();
                String senha = user.getPassword();
              //Se login tiver sucesso, vai para a pagina inicial logada, senão vai para o registro.  
                if(uDAO.login( email, senha )){
                response.sendRedirect("logged.jsp");
                } else {
                    response.sendRedirect("register.jsp");
                } 
            }   
    }
    // Função de registrar usuario
    protected void RegUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             try (PrintWriter out = response.getWriter()) {
            //Pegar os dados do usuario que serão gravados e armazenados no BD
            UsuarioVO user = new UsuarioVO();
            user.setEmail(request.getParameter("email"));
            user.setUsername(request.getParameter("nome"));
            user.setPassword(request.getParameter("senha"));
            
            UsuarioDAO uDAO = new UsuarioDAO();
            //Se o registro der certo, vai para o login, senão vai para a página inicial
            if(uDAO.gravar(user)){
               response.sendRedirect("login.jsp");
            }else{
               response.sendRedirect("index.html"); 
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
