/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import VO.ProdutoVO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class ProductController extends HttpServlet {

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

        // Adiciona o cabeçalho de segurança
        response.setHeader("X-Content-Type-Options", "nosniff");

        // Checar função que deve ocorrer
        String acao = request.getParameter("acao");
        if (acao != null) {
            switch (acao) {
                case "listar":
                    ProdutoDAO p = null;
                    try {
                        p = new ProdutoDAO();
                    } catch (SQLException ex) {
                        Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("lista", p.ListarProdutos());
                    HttpSession session = request.getSession();
                    Integer userId = (Integer) session.getAttribute("userId");

                    // Encaminhar para a página adequada
                    if (userId != null) {
                        request.getRequestDispatcher("/homeOn.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("/homeOff.jsp").forward(request, response);
                    }
                    break;

                case "visualizar":
                    ViewProduct(request, response);
                    break;
                case "cadastrar":
                    CadProduct(request, response);
                    break;
                case "carregar":
                    int produtoId = Integer.parseInt(request.getParameter("produtoid"));
                    ProdutoDAO g = null;
                    try {
                        g = new ProdutoDAO();
                    } catch (SQLException ex) {
                        Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    ProdutoVO produto = g.getProdutoById(produtoId); // Método para buscar produto por ID
                    request.setAttribute("produtoid", produto.getId());
                    request.setAttribute("nome_produto", produto.getNome());
                    request.setAttribute("ds_produto", produto.getDs_produto());
                    request.setAttribute("preco_produto", produto.getPreco());
                    request.setAttribute("tamanho_produto", produto.getTamanho());
                    request.setAttribute("categoria_produto", produto.getCategoria());
                    request.setAttribute("genero_produto", produto.getGenero());
                    request.setAttribute("qnt_produto", produto.getQuantidade());
                    request.setAttribute("img_produto", produto.getDs_img());
                    request.getRequestDispatcher("ProductController?acao=listar_lista").forward(request, response);
                    break;

                case "atualizar":
                    UpdateProduct(request, response);
                    break;
                case "excluir":
                    DelProduct(request, response);
                    break;
                case "listar_lista":
                    ProdutoDAO t = null;
                    try {
                        t = new ProdutoDAO();
                    } catch (SQLException ex) {
                        Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    request.setAttribute("listar", t.ListarProdutos());
                    request.getRequestDispatcher("/admin_page.jsp").forward(request, response);
                    break;

                default:
                    break;
            }
        }
    }

    protected void ViewProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtém o ID do produto, usa o DAO para obter os dados do produto pelo ID
        int productId = Integer.parseInt(request.getParameter("id"));
        ProdutoDAO pDAO = null;
        try {
            pDAO = new ProdutoDAO();
        } catch (SQLException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        ProdutoVO product = pDAO.getProdutoById(productId);

        // Se o produto for encontrado, vai para view_product, senão envia uma mensagem de erro
        if (product != null) {
            request.setAttribute("product", product);
            request.getRequestDispatcher("/view_product.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Produto não encontrado");
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

    protected void CadProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            //Pegar os dados do usuario que serão gravados e armazenados no BD
            ProdutoVO product = new ProdutoVO();
            product.setNome(request.getParameter("nome_produto"));
            product.setDs_produto(request.getParameter("ds_produto"));
            product.setPreco(Double.parseDouble(request.getParameter("preco_produto")));
            product.setTamanho(request.getParameter("tamanho_produto"));
            product.setCategoria(request.getParameter("categoria_produto"));
            product.setGenero(request.getParameter("genero_produto"));
            product.setQuantidade(Integer.parseInt(request.getParameter("qnt_produto")));
            product.setDs_img(request.getParameter("img_produto"));

            ProdutoDAO uDAO = null;
            try {
                uDAO = new ProdutoDAO();
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
            //Se o registro der certo, vai para o login, senão vai para a página inicial
            if (uDAO.cadastrar(product)) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("index.html");
            }
        }
    }

    //Função para deletar produto
    protected void DelProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            ProdutoDAO produto = null;
            try {
                produto = new ProdutoDAO();
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
            String produtoIdStr = request.getParameter("produtoid"); // Pega o id do select-list do admin_page.jsp
            int id = Integer.parseInt(produtoIdStr);

            if (produto.ExcluirProduto(id)) { // Se o delete tiver sucessso lista e redireciona à admin_page
                response.sendRedirect("ProductController?acao=listar_lista");
            } else {
                response.sendRedirect("admin_page.jsp");
            }
        }
    }

    protected void UpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            //Pegar os dados do usuario que serão gravados e armazenados no BD
            ProdutoVO produto = new ProdutoVO();

            produto.setNome(request.getParameter("nome_produto"));
            produto.setPreco(Double.parseDouble(request.getParameter("preco_produto")));
            produto.setDs_produto(request.getParameter("ds_produto"));
            produto.setTamanho(request.getParameter("tamanho_produto"));
            produto.setCategoria(request.getParameter("categoria_produto"));
            produto.setGenero(request.getParameter("genero_produto"));
            produto.setQuantidade(Integer.parseInt(request.getParameter("qnt_produto")));
            produto.setDs_img(request.getParameter("img_produto"));
            produto.setId(Integer.parseInt(request.getParameter("produtoid")));

            ProdutoDAO ProdutoDAO = null;
            try {
                ProdutoDAO = new ProdutoDAO();
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
            }
            //Se o update der certo, vai para a tela inicial, senão vai para a pagina de usuario
            if (ProdutoDAO.updateProd(produto)) {
                response.sendRedirect("ProductController?acao=listar_lista");
            } else {
                response.sendRedirect("admin_page.jsp");
            }
        }

    }
}
