<%-- 
    Document   : logged
    Created on : 6 de mai. de 2024, 21:55:30
    Author     : unico
--%>

<%@page import="VO.ProdutoVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<%      
    session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");

    if (userId != null) {

%>


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
                <nav style="float: right; margin-right: 0px;">
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
                        <a href="logged.jsp" style="margin-left: 220px; margin-right: 40px;">Inicio</a>
                    <a href="#" style="margin-right: 40px;">Produtos</a>
                    <a href="#" style="margin-right: 40px;">Sobre nós</a>
                    </strong>
                </nav>
                <br>
            </div> 
        </div>
        </header>
                    
       <div class="list_products">
           <div style="width: 200px; height: auto;">
               <a href="view_product.jsp">
               <img style="width: 210px; height: auto; border-radius: 5px; box-shadow: 4.5px 4.5px #8DA8EE;" src="imagens/FERRARI-JACKET.webp" alt="alt"/>
               <pre style="font-weight: 800; font-size: 14px">Jaqueta de corrida Ferrari.<br>RS$ 500</pre>
               </a>
           </div>
           <% out.print("<td><a href=\"ProductController?acao=listar\">Listar</a></td>");%>
                   <%
            List produtos = (List) request.getAttribute("lista");
            if (produtos != null) {
                out.print("Achados: " + produtos.size() + "<br><br><br>");
                out.print("<table width=\"50%\" border=\"1\" cellspacing=\"0\" align=\"center\">");
                for (int cont = 0; cont < produtos.size(); cont++) {
                    ProdutoVO p = new ProdutoVO();
                    p = (ProdutoVO) produtos.get(cont);
                    out.print("<tr>");
out.print("<td><img style=\"width: 210px; height: auto; border-radius: 5px; box-shadow: 4.5px 4.5px #8DA8EE;\" src=\"imagens/" + p.getDs_img() + "\" alt=\"alt\"/></td>");
                    out.print("<td>" + p.getDs_img()+ "</td>");
                    out.print("<td>" + p.getNome()+ "</td>");
                    out.print("<td>" + p.getPreco()+ "</td>");


                    //out.print("<td><a href=\"ProdutoController?operacao=2&id="+p.getId()+"\">Listar</a></td>");
                    //out.print("<td><a href=\"ProdutoController?operacao=3&id="+p.getId()+"\">Alterar</a></td>");
                    out.print("</tr>");
                }
                out.print("</table>");
            }            
        %>
           
           
           
           
       </div>

    </body>
</html>

<%  
    } 
    else {
        response.sendRedirect("login.jsp");
    }   
%>