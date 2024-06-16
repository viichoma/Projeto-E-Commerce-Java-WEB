<%-- 
    Document   : view_product
    Created on : 26 de mai. de 2024, 23:02:03
    Author     : unico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="VO.ProdutoVO"%>

<%      
    session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");
    String userEmail = (String) session.getAttribute("email");
    
    ProdutoVO product = (ProdutoVO) request.getAttribute("product");
    if (product == null) {
        response.sendRedirect("ProductController?acao=listar");
        return;
    }
%>

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
                            out.print("<a href=\"ProductController?acao=listar_lista\" class=\"carrinho\">ADM</a>");                        }
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
                    
        <div class="view_product">
            <div style="width: 600px; height: auto;">
                <img style="width: 500px; height: auto; border-radius: 5px;" src="<%= product.getDs_img() %>" alt="alt"/>
            </div>
            <div style="height: 400px; flex: 0; padding: 52px;">
                <pre style="font-weight: 800; font-size: 20px"><%= product.getNome() %><h2>R$ <%= product.getPreco() %></h2></pre>
                <form action="" style="display: flex; flex-direction: column; align-items: center;">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="id" value="<%= product.getId() %>">
                    <input type="hidden" name="name" value="<%= product.getNome() %>">
                    <input type="hidden" name="price" value="<%= product.getPreco() %>">
                    <input type="hidden" name="image" value="<%= product.getDs_img() %>">

                    <div style="display: flex; justify-content: center; gap: 10px;">
                        <%
                            for (String tamanho : product.getTamanhos()) {
                                String sizeId = "size_" + tamanho;
                        %>
                                <input type="radio" id="<%= sizeId %>" name="size" value="<%= tamanho %>">
                                <label for="<%= sizeId %>"> <%= tamanho %> </label>
                        <%
                            }
                        %>
                    </div><br><br>
                    <label for="product_quant"> Quantidade </label><br>
                    <input type="number" id="" name="product_quant" value="1" style="width: 80px; text-align: center;"><br><br>
                    <input type="submit" class="add_cart" value="Adicionar ao Carrinho">
                </form>
            </div>
        </div>

    </body>
</html>

