<%-- 
    Document   : cart
    Created on : 9 de mai. de 2024, 16:24:47
    Author     : unico
--%>
<%@page import="VO.CartVO"%>
<%@page import="DAO.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!-- Tratamento de sessão para saber se o usuario está logado, pegando o ID e se o o usuario é Administrador -->
<!-- Caso o Id não for nulo a pagina aparece, caso contrário redireciona para outro comando -->
<%
    session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");
    String Administrador = (String) session.getAttribute("adm");
    ArrayList<CartVO> cart_list = (ArrayList<CartVO>) session.getAttribute("cart-list");
    List<CartVO> cartProduct = null;
    if (cart_list != null && !cart_list.isEmpty()) {
        ProdutoDAO pDao = new ProdutoDAO();
        cartProduct = pDao.getCartProducts(cart_list);
        request.setAttribute("cart_list", cart_list);
    }
    if (userId != null) {
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Le Saint Jean</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="StyleScript/styles.css">
        <link rel="shortcut icon" type="imagex/png" href="./imagens/site_icon.ico">
    </head>
    <body>
        <!-- Cabeçalho com o MenuGeral presente em todo o site -->
        <header>
            <div id="MenuGeral" class="" >
                <div id="menu_logo">
                    <img src="imagens/site_logo.png" alt="alt" class="menu_logo"/>
                </div><br>

                <!-- Conjunto de acessos de login e carrinho do site-->
                <nav style="float: right; margin-right: 10px;">
                    <strong>
                        <a href="user_profile.jsp" class="login">
                            <!-- Verificar e pegar o nome do usuário -->
                            <%                String username = (String) session.getAttribute("username");
                                if (username != null && !username.trim().isEmpty()) {
                                    String firstName = username.split(" ")[0];
                                    out.println(firstName);
                                } else {
                                    out.println("Nome não disponível");
                                }
                            %>
                        </a>
                        <a href="cart.jsp" class="carrinho">Carrinho</a>   
                        <!-- Caso ADM, acesso a página admin_page -->
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
                            <a href="about_us.jsp" style="margin-right: 40px;">Sobre nós</a>
                        </strong>
                    </nav><br>
                </div> 
            </div>
        </header>

        <div>
            <h1  style="
                 padding-top: 20px;
                 padding-left: 200px;

                 ">Seu carrinho</h1>
            <div
                style="
                padding-top: 20px;
                padding-left: 200px;

                ">
                <table style="border: 0px solid black; width: 1500px; height: auto;scale: 95%;">
                    <colgroup>
                        <col style="width: 15%;">
                        <col style="width: 30%;">
                        <col style="width: 15%;">
                        <col style="width: 20%;">
                        <col style="width: 0%;">
                    </colgroup>
                    <tr>
                        <th style="font-size: 18px;">Produto</th>
                        <th></th>
                        <th style="font-size: 18px">Quantidade</th>
                        <th style="font-size: 18px">Preço</th>
                    </tr>
                    <%
                        if (cart_list != null) {
                            for (CartVO c : cartProduct) {
                    %>
                    <tr style="border: 0px solid black; height: 150px; padding-bottom: 20px; text-align: center;">
                        <td style="border: 0px solid black;">
                            <div style="display: flex; justify-content: center; align-items: center;">
                                <img src="<%= c.getDs_img()%>" alt="alt" style="width: 200px; height: auto;"/>
                            </div>
                        </td>
                        <td>
                            <p><%=c.getNome()%></p>
                        </td>
                        <td style="vertical-align: middle;">
                            <form action="order-now" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
                                    <input type="number" name="quantity" class="form-control"  value="<%=c.getItem_quantidade()%>" style="text-align: center; width: 100px;"> 
                                    <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                </div>
                            </form>
                        </td>
                        <td style="vertical-align: middle;">
                            <p>R$ <%=c.getPreco()%>0</p>
                        <td style="vertical-align: middle;">
                        <td><a href="remove-from-cart?id=<%=c.getId()%>" class="btn btn-sm btn-danger">Remover</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </table>
            </div>

            <div>
                <br><br><input type="submit" placeholder="" value="Confirmar Pagamento" class="add_cart" style="margin-left: 1450px">
            </div>
        </div>

    </body>

</html>
<!-- Se não estiver logado, redireciona para login.jsp -->
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>