<%-- 
    Document   : register
    Created on : 2 de mai. de 2024, 16:09:19
    Author     : unico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro - Zenit</title>
    </head>
    <body>

        <div style="background-color: navajowhite; text-align: center">
            <form action="LoginController" method="post">
                <input type="hidden" name="acao" value="register">
            <h2>Entrar</h2>
            <p>Insira seu e-mail e senha para entrar:</p>
            <input type="text" name="nome" placeholder="Nome"><br><br>
            <input type="text" name="email" placeholder="E-mail"><br><br>
            <input type="password" name="senha" placeholder="Senha"><br><br>
            <input type="password" name="ConfSenha" placeholder="Confrimar senha"><br><br>
            <input type="submit">
            <p><a href="login.jsp">Voltar</a></p>
            
            </form>
        </div>
        
        
        
        
        
</html>
