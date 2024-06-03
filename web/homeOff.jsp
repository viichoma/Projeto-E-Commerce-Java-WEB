<%-- 
    Document   : index
    Created on : 2 de jun. de 2024, 16:19:37
    Author     : unico
--%>

<%@page import="VO.ProdutoVO"%>
<%@page import="java.util.List"%>
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
                    } else { out.println("Nome não disponível") ;}
                    %>
                    </a>
                    <a href="cart.jsp" class="carrinho">Carrinho</a>

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
    <div class="list_products">
                   <%
            //out.print("<div class=\"list_products\">");           
            List produtos = (List) request.getAttribute("lista");
            if (produtos != null) {
                //out.print("Achados: " + produtos.size() + "<br><br><br>");
                out.print("<table>");
                for (int cont = 0; cont < produtos.size(); cont++) {
                    ProdutoVO p = new ProdutoVO();
                    p = (ProdutoVO) produtos.get(cont);

                    

            if (cont % 5 == 0) {
                out.print("<tr>");
            }
                    out.print("<td>");
                    out.print("<div style='width: 200px; height: auto; margin-right: 100px;'>");
                        out.print("<a href='view_product.jsp'>");
                        out.print("<img style=\"width: 210px; height: 315px; border-radius: 5px; border: 1.7px solid #8DA8EE; box-shadow: 4.5px 4.5px #8DA8EE;\" src=\"imagens/" + p.getDs_img() + "\" alt=\"alt\"/>");
                        out.print("<pre style=\"font-weight: 800; font-size: 14px\">" + p.getNome()+ "<br>R$ " + p.getPreco()+ "</pre>");
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
 
       </div>


        
    </body>
</html>
