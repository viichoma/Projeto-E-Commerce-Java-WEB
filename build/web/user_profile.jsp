<%-- 
    Document   : user_profile
    Created on : 6 de mai. de 2024, 21:59:32
    Author     : unico
--%>

<%      
    session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");

    if (userId != null) {

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
                    } else { out.println("Nome não disponível") ;}
                    %>
                    </a>
                    <a href="cart.jsp" class="carrinho">Carrinho</a>
                    
                    <%
                        if (userId == 9) {
                        out.print("<a href=\"admin_page.jsp\" class=\"carrinho\">ADM</a>");
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
       
               <!-- Formulario de registro que leva os dados a controloadora LoginController -->
        <div style="
             position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
             background-color: #ffffff;
            border: 1px solid #7a98e4;
            border-radius: 3px;
            box-shadow: 6px 6px #7a98e4;
             height: 600px;
             width: 800px;
             ">
            <div style="text-align: center">
            <form action="LoginController" method="post">
            <!-- Se a ação for register, o LoginController efetua a funçao de gravar -->
            <input type="hidden" name="acao" value="update">
            <h1 style=" font-size: 40px; color: #7a98e4; text-shadow:  1px 2px #6E69CA;">Meu Perfil</h1>
            <p>Altere os campos caso queira alterar seus dados:</p>
            <br><input type="text" name="nome_profile" placeholder="Nome" required value="<% out.println( session.getAttribute("username"));%>"  class="login_input"><br><br>
            <input type="text" name="email_profile" placeholder="E-mail" required value="<% out.println( session.getAttribute("email"));%>" class="login_input"><br><br>
            <input type="password" name="senha_profile" placeholder="Nova senha" required class="login_input"><br><br>
            <input type="submit" class="submit_input" value="Alterar">

            
            </form>
                <img src="imagens/user_icon.png" alt="alt" style="
                    position: absolute;
                    top: 35%;
                    left: 15%;
                    transform: translate(-50%, -50%);
                     width: 150px;
                     height: auto;
                     "/><br><br>

                <a href="LoginController?acao=deslogar">
                    <img src="imagens/log-out.svg" alt="alt" 
                    title="Sair da conta"
                    style="
                     
                    position: absolute;
                    top: 90%;
                    left: 8%;
                    transform: translate(-50%, -50%);
                    width: 60px;
                    height: auto;
                    "/>
                </a>
                
                <a href="LoginController?acao=excluir&id=<%= session.getAttribute("userId") %>">
                <img src="imagens/delete_user.webp" alt="alt" 
                    title="Excluir usuario"
                    style="
                     
                    position: absolute;
                    top: 90%;
                    left: 90%;
                    transform: translate(-50%, -50%);
                    width: 60px;
                    height: auto;
                    "/>
                </a>
            </div>
        </div>
    </body>
</html>

<%  
    } 
    else {
        response.sendRedirect("login.jsp");
    }   
%>