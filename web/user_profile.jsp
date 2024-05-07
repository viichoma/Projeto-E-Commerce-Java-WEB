<%-- 
    Document   : user_profile
    Created on : 6 de mai. de 2024, 21:59:32
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
                    <a href="#" class="login">USERNAME</a>
                    <a href="#" class="carrinho">Carrinho</a>
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
            <input type="hidden" name="acao" value="register">
            <h1 style=" font-size: 40px; color: #7a98e4; text-shadow:  1px 2px #6E69CA;">Meu Perfil</h1>
            <p>Altere os campos caso queira alterar seus dados:</p>
            <input type="text" name="nome" placeholder="Nome" required class="login_input"><br><br>
            <input type="text" name="email" placeholder="E-mail" required class="login_input"><br><br>
            <input type="password" name="senha" placeholder="Senha atual" required class="login_input"><br><br>
            <input type="password" name="ConfSenha" placeholder="Nova senha" required class="login_input"><br><br>
            <input type="submit" class="submit_input" >

            
            </form>
            </div>
        </div>
    </body>
</html>