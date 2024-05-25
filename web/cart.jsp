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
                    <a href="login.jsp" class="login">Login</a>
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
       
       <div
           style="
           padding-top: 100px;
           padding-left: 300px; 
           ">
           
           <table style="border: 1.5px solid black; width: 600px; height: auto">
               <tr style="border: 1.5px solid black; height: 150px; padding-bottom: 20px">
                   
                   <td style="border: 1.5px solid black; ">
                       <div><img src="src" alt="alt"/></div>
                       Dados
                   </td>
               </tr>
               
               <tr style="border: 1.5px solid black; height: 150px;">
                   <td style="border: 1.5px solid black; "> Dados </td>
               </tr>
               
               <tr style="border: 1.5px solid black; height: 150px;">
                   <td style="border: 1.5px solid black; "> Dados </td>
               </tr>
               
               <tr style="border: 1.5px solid black; height: 150px;">
                   <td style="border: 1.5px solid black; "> Dados </td>
               </tr>
               <tr style="border: 1.5px solid black; height: 150px;">
                   <td style="border: 1.5px solid black; "> Dados </td>
               </tr>
           </table>
       </div>
    
    </body>
    
</html>
