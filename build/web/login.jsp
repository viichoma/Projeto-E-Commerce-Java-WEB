<%-- 
    Document   : index
    Created on : 2 de mai. de 2024, 14:33:41
    Author     : unico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="styles.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Zenit</title>
    </head>
    <body>

        <div style="background-color: navajowhite; text-align: center">
            <form action="LoginController" method="post">
             <input type="hidden" name="acao" value="logar">
            <h2>Entrar</h2>
            <p>Insira seu e-mail e senha para entrar:</p>
            <input type="text" name="email" placeholder="E-mail"><br><br>
            <input type="password" name="senha" placeholder="Senha"><br><br>
            <input type="submit">
            <p>Não possui uma conta? <a href="register.jsp">Criar conta</a></p>
            
            </form>
        </div>
        
        
        
        
        
    </body>
</html>
