<%-- 
    Document   : about_us
    Created on : 27 de mai. de 2024, 21:42:19
    Author     : unico
--%>
<%@page import="java.util.List"%>
<%@page import="VO.ProdutoVO"%>
<%      
    session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");
    String userEmail = (String) session.getAttribute("email");
%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Le Saint Jean</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css">
        <link rel="shortcut icon" type="imagex/png" href="./imagens/site_icon.ico">
    </head>
    
    <body>
       <!-- Cabeçalho com o MenuGeral presente em todo o site -->
 <header>
        <div id="MenuGeral" class="" >
            <div id="menu_logo">
                <img src="imagens/site_logo.png" alt="alt" class="menu_logo"/>
            </div>
            <br>
            <!-- Conjunto de acessos de login e carrinho do site-->
                <nav style="float: right; margin-right: 10px;">
                    <strong>
                    <a href="user_profile.jsp" class="login">
                    <%
                    String username = (String) session.getAttribute("username");
                    if (username != null && !username.trim().isEmpty()) {
                        String firstName = username.split(" ")[0];
                        out.println(firstName);
                    } else { out.println("Convidado") ;}
                    %>
                    </a>
                    <a href="cart.jsp" class="carrinho">Carrinho</a>
                      
                    <%
                        if (userEmail != null && userEmail.equals("vi@admin.com")) {
                            out.print("<a href=\"ProductController?acao=listar_lista\" class=\"carrinho\">ADM</a>");
                        }
                    %>
              

                    </strong>
                </nav>
            
            <div>
                <!-- Conjunto de acessos central do site-->
                <nav style="">
                    <strong>
                    <a href="ProductController?acao=listar" style="margin-left: 310px; margin-right: 40px;">Inicio</a>
                    <a href="#" style="margin-right: 40px;">Produtos</a>
                    <a href="about_us.jsp" style="margin-right: 40px;">Sobre nós</a>
                    </strong>
                </nav>
                <br>
            </div> 
        </div>
        </header>
        <div>
          <!---  <img src="imagens/le_saint_jean.webp" alt="alt" style="width: 500px; height: auto;position: absolute;
                    top: 45%;
                    left: 15%;
                    transform: translate(-50%, -50%);"/> ---->
          
          
                       <form action="ProductController" method="post">
                    <input type="hidden" name="acao" value="listar_lista">
                           
            <%
            //out.print("<div class=\"list_products\">");
            List<ProdutoVO> produtos = (List<ProdutoVO>) request.getAttribute("listar");
            if (produtos != null) {
                //out.print("Achados: " + produtos.size() + "<br><br><br>");
                out.print("<table>");
                for (int cont = 0; cont < produtos.size(); cont++) {
                    ProdutoVO p = (ProdutoVO) produtos.get(cont);  

                    if (cont % 5 == 0) {
                        out.print("<tr>");
                    }
                    
                    out.print("<td>");
                    out.print("<div style='width: 200px; height: auto; margin-right: 100px;'>");
                        out.print("<a href='ProductController?acao=visualizar&id=" + p.getId() + "'>");
                        out.print("<pre style='font-weight: 800; font-size: 14px'>" + p.getNome() + "<br>R$ " + p.getPreco() + "</pre>");
                        out.print("</a>");
                    out.print("</div>");
                    out.print("</td>");

                    if ((cont + 1) % 5 == 0 || cont == produtos.size() - 1) {
                        out.print("</tr>");
                    }
                    
                }
                
                out.print("</table>");
            }
            %>
                    <br><br><input type="submit"">
                    </form> 
       </div>
       
    </body>
</html>
