/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import DAO.UsuarioDAO;
import VO.UsuarioVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    // Checar função que deve ocorrer
    String acao = request.getParameter("acao");
        if (acao != null) {
        switch (acao) {
            case "logar":
                LoginUser(request, response);
                break;
            case "register":
                RegUser(request, response);
                break;
            case "update":
                UpdateUser(request, response);
            case "excluir":
                DelUser(request, response);
                break;
            case "deslogar":
                 HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
        // Redireciona para a página de login
                response.sendRedirect("login.jsp");
                break;
            default:
                break;
                      }
                         }
    }
    // Função de Login de usuari´´´Ko
     protected void LoginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            try (PrintWriter out = response.getWriter()) {
                UsuarioVO user = new UsuarioVO();
                user.setEmail(request.getParameter("email"));
                user.setPassword(request.getParameter("senha"));
                
                //Pegar os dados que serão checados no BD para logar
                UsuarioDAO uDAO = new UsuarioDAO();
                String email = user.getEmail();
                String senha = user.getPassword();
                //Pegar os do usuario que logou
                Integer userID = uDAO.getID(email, senha);
                String username = uDAO.getUsername(email, senha);
                
              //Se login tiver sucesso, vai para a pagina inicial logada, senão vai para o registro.  
              // Verifica a função getID também, para caso o ID ficar nulo.
                if(uDAO.login( email, senha ) && (userID != null) ){
                    HttpSession session = request.getSession(); //Pegar a sesão atual
                    session.setAttribute("userId", userID); // Setar atributos à sessão
                    session.setAttribute("email", email);
                    session.setAttribute("username", username);
                    
                    response.sendRedirect("logged.jsp"); // Encaminhar para logged.jsp caso tudo ocorra bem.
                } else {
                    response.sendRedirect("register.jsp"); // Encaminhar para register.jsp caso tudo dê errado.
                }
                

            }   
    }
    // Função de registrar usuario
    protected void UpdateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             try (PrintWriter out = response.getWriter()) {
            //Pegar os dados do usuario que serão gravados e armazenados no BD
            UsuarioVO user = new UsuarioVO();
            user.setUsername(request.getParameter("nome_profile"));
            user.setEmail(request.getParameter("email_profile"));
            user.setPassword(request.getParameter("senha_profile"));
            
            HttpSession session = request.getSession(); //Pegar a sesão atual
            user.setId((Integer) session.getAttribute("userId")); // Setar atributos à sessão
            
            UsuarioDAO uDAO = new UsuarioDAO();
            //Se o update der certo, vai para a tela inicial, senão vai para a pagina de usuario
            if(uDAO.update(user)){
                session.setAttribute("username", user.getUsername()); // Setar os novos atributos à sessão
                session.setAttribute("email", user.getEmail());
                response.sendRedirect("logged.jsp");
            }else{
                response.sendRedirect("user_profile.jsp"); 
            }
        }
        
    }
    
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
    
    protected void DelUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             try (PrintWriter out = response.getWriter()) {
                UsuarioDAO user = new UsuarioDAO();
                HttpSession session = request.getSession(); //Pegar a sesão atual
                int id = ((Integer) session.getAttribute("userId")); // Setar atributos à sessão
                
            if(user.ExcluirConta(id)){
                response.sendRedirect("index.html");
            }else{
                response.sendRedirect("user_profile.jsp"); 
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
