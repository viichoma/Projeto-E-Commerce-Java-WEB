<%-- 
    Document   : user_profile
    Created on : 6 de mai. de 2024, 21:59:32
    Author     : unico
--%>
       <!-- Tratamento de sessão para saber se o usuario está logado, pegando o ID e se o o usuario é Administrador -->
       <!-- Caso o Id não for nulo a pagina aparece, caso contrário redireciona para outro comando -->
<%      
    session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");
    String Administrador = (String) session.getAttribute("adm");
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
            <%
                String username = (String) session.getAttribute("username");
                if (username != null && !username.trim().isEmpty()) {
                    String firstName = username.split(" ")[0];
                    out.println(firstName);
                } else { out.println("Nome não disponível") ;}
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
       
        <!-- Formulario de registro que leva os dados a controloadora LoginController -->
        <div class="user_profile">
            <div style="text-align: center">
            <form action="LoginController" method="post">
                <!-- Formulario para atualizar um usuario -->
                <input type="hidden" name="acao" value="update">
                <h1 style=" font-size: 40px; color: #7a98e4; text-shadow:  1px 2px #6E69CA;">Meu Perfil</h1>
                <p>Altere os campos caso queira alterar seus dados:</p><br>
                <input type="text" name="nome_profile" placeholder="Nome" required value="<% out.println( session.getAttribute("username"));%>"  class="login_input"><br><br>
                <input type="text" name="email_profile" placeholder="E-mail" required value="<% out.println( session.getAttribute("email"));%>" class="login_input"><br><br>
                <input type="password" name="senha_profile" placeholder="Nova senha" required class="login_input"><br><br>
                <input type="submit" class="submit_input" value="Alterar">
            </form>
                
                <img src="imagens/user_icon.png" alt="alt" class="user_icon"/><br><br>

                <a href="LoginController?acao=deslogar">
                    <img src="imagens/log-out.svg" alt="alt" title="Sair da conta" class="log_out"/>
                </a>
                
                <!-- Anexo que serve de função de excluir usuario -->
                <a href="LoginController?acao=excluir&id=<%= session.getAttribute("userId") %>">
                <img src="imagens/delete_user.webp" alt="alt" title="Excluir usuario" class="delete_user"/>
                </a>
            </div>
        </div>
    </body>
</html>
<!-- Se não estiver logado, redireciona para login.jsp -->
<%  
    } 
    else {
        response.sendRedirect("login.jsp");
    }   
%>