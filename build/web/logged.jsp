<%-- 
    Document   : logged
    Created on : 6 de mai. de 2024, 21:55:30
    Author     : unico
--%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
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
                <nav style="float: right; margin-right: 0px;">
                    <strong>
                    <a href="user_profile.jsp" class="login">USERNAME</a>
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
       <div style="width: 1500px;height: auto; min-height: 300px; border: 0px solid black;
                    position: absolute;
                    top: 40%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                     ">
           <div style="width: 200px; height: auto;">
               <a href="#">
               <img style="width: 210px; height: auto; border-radius: 5px; box-shadow: 4.5px 4.5px #8DA8EE;" src="imagens/FERRARI-JACKET.webp" alt="alt"/>
               <pre style="font-weight: 800; font-size: 14px">Jaqueta de corrida Ferrari.<br>RS$ 500</pre>
               </a>
           </div>
       </div>

    </body>
</html>
