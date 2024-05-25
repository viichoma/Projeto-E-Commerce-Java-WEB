<%-- 
    Document   : register
    Created on : 2 de mai. de 2024, 16:09:19
    Author     : unico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="imagex/png" href="./imagens/site_icon.ico">
        <link rel="stylesheet" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro - Le Saint Jean</title>
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
                    <a href="login.jsp" class="login">Login</a>
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
        <div style="text-align: center">
            <form action="LoginController" method="post">
            <!-- Se a ação for register, o LoginController efetua a funçao de gravar -->
            <input type="hidden" name="acao" value="register">
            <h2>Entrar</h2>
            <p>Insira seu e-mail e senha para entrar:</p>
            
            <input type="text" name="nome" placeholder="Nome" required class="login_input"><br><br>
            <input type="text" name="email" placeholder="E-mail" required class="login_input"><br><br>
            <input type="password" name="senha" placeholder="Senha" required class="login_input"><br><br>
            <input type="password" name="ConfSenha" placeholder="Confrimar senha" required class="login_input"><br><br>
            <input type="submit" class="submit_input" >
            
            <p><a href="login.jsp">Voltar</a></p>
            
            </form>

        </div>
        
        
        
        
        
</html>
