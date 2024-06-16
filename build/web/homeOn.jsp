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


       <!-- Tratamento de sess�o para saber se o usuario est� logado, pegando o ID e se o o usuario � Administrador -->
       <!-- Caso o Id n�o for nulo a pagina aparece, caso contr�rio redireciona para outro comando -->
<%      
    session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");
    String Administrador = (String) session.getAttribute("adm");

    if (userId != null) {

%>

<html>
    <head>
        <title>Le Saint Jean</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="StyleScript/styles.css">
        <link rel="shortcut icon" type="imagex/png" href="./imagens/site_icon.ico">
    </head>
    
    <body>
       <!-- Cabe�alho com o MenuGeral presente em todo o site -->
    <header>
        <div id="MenuGeral" class="" >
            <div id="menu_logo">
                <img src="imagens/site_logo.png" alt="alt" class="menu_logo"/>
            </div><br>
            
            <!-- Conjunto de acessos de login e carrinho do site-->
            <nav style="float: right; margin-right: 10px;">
                <strong>
                <a href="user_profile.jsp" class="login">
       <!-- Verificar e pegar o nome do usu�rio -->
            <%
                String username = (String) session.getAttribute("username");
                if (username != null && !username.trim().isEmpty()) {
                    String firstName = username.split(" ")[0];
                    out.println(firstName);
                } else { out.println("Nome n�o dispon�vel") ;}
            %>
                </a>
                <a href="cart.jsp" class="carrinho">Carrinho</a>   
       <!-- Caso ADM, acesso a p�gina admin_page -->
            <%
                if ("Y".equals(Administrador)) {
                    out.print("<a href=\"ProductController?acao=listar_lista\" class=\"carrinho\">ADM</a>");
                }
             %>
                </strong>
            </nav>
            
            <div>
                <!-- Conjunto de acessos central do site-->
                <nav>
                    <strong>
                    <a href="ProductController?acao=listar" style="margin-left: 310px; margin-right: 40px;">Inicio</a>
                    <a href="#" style="margin-right: 40px;">Produtos</a>
                    <a href="about_us.jsp" style="margin-right: 40px;">Sobre n�s</a>
                    </strong>
                </nav><br>
            </div> 
        </div>
    </header>
                
       <!-- Comando para listagem dos produtos do BD -->    
        <div class="list_products">
        <%
        List<ProdutoVO> produtos = (List<ProdutoVO>) request.getAttribute("lista");
        if (produtos != null) {
            out.print("<table>");
            for (int cont = 0; cont < produtos.size(); cont++) {
                ProdutoVO p = (ProdutoVO) produtos.get(cont);
                if (cont % 5 == 0) {
                    out.print("<tr>");
                }
                out.print("<td>");
                out.print("<div style='width: 200px; height: auto; margin-right: 100px;'>");
                    out.print("<a href='ProductController?acao=visualizar&id=" + p.getId() + "'>");
                    out.print("<img style=\"width: 210px; height: 315px; border-radius: 5px; border: 1.7px solid #8DA8EE; box-shadow: 4.5px 4.5px #8DA8EE;\" src=\"" + p.getDs_img() + "\" alt=\"alt\"/>");
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
       </div>

    </body>
</html>
<!-- Se n�o estiver logado, redireciona para homeOff -->
<%  
    } 
    else {
        response.sendRedirect("ProductController?acao=listar");
    }   
%>