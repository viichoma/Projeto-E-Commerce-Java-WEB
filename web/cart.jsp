<%-- 
    Document   : cart
    Created on : 9 de mai. de 2024, 16:24:47
    Author     : unico
--%>

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
                <nav style="float: right; margin-right: 20px;">
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
                    <a href="index.html" style="margin-left: 220px; margin-right: 40px;">Inicio</a>
                    <a href="#" style="margin-right: 40px;">Produtos</a>
                    <a href="#" style="margin-right: 40px;">Sobre nós</a>
                    </strong>
                </nav>
                <br>
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
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                    </colgroup>
                <tr>
                    <th style="font-size: 18px;">Produto</th>
                    <th></th>
                    <th style="font-size: 18px">Quantidade</th>
                    <th style="font-size: 18px">Preço</th>
                </tr>
                <tr style="border: 0px solid black; height: 150px; padding-bottom: 20px; text-align: center;">
                    <td style="border: 0px solid black;">
                        <div style="display: flex; justify-content: center; align-items: center;">
                            <img src="imagens/FERRARI-JACKET.webp" alt="alt" style="width: 200px; height: auto;">
                        </div>
                    </td>
                    <td>
                        <p>Jaqueta de corrida Ferrari</p>
                    </td>
                    <td style="vertical-align: middle;">
                        <input type="number" placeholder="Quantidade" value="1" style="text-align: center; width: 100px;">
                    </td>
                    <td style="vertical-align: middle;">
                        <p>R$ 500,00</p>
                    </td>
                </tr>
            </table>
            </div>
           
           <div>
               <br><br><input type="submit" placeholder="" value="Confirmar Pagamento" class="add_cart" style="margin-left: 1450px">
           </div>
        </div>
    
    </body>
    
</html>
