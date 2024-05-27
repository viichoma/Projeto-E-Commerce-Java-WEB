<%-- 
    Document   : view_product
    Created on : 26 de mai. de 2024, 23:02:03
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
                        <a href="logged.jsp" style="margin-left: 220px; margin-right: 40px;">Inicio</a>
                    <a href="#" style="margin-right: 40px;">Produtos</a>
                    <a href="#" style="margin-right: 40px;">Sobre nós</a>
                    </strong>
                </nav>
                <br>
            </div> 
        </div>
        </header>
       <div style="width: 1000px;height: auto; min-height: 300px; border: 0px solid black; display: flex; flex-direction: row;;
                    position: absolute;
                    top: 58%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                     ">
           <div style="width: 600px; height: auto;">
               <img style="width: 500px; height: auto; border-radius: 5px;" src="imagens/FERRARI-JACKET.webp" alt="alt"/>
           </div>
           <div style="    height: 400px; flex: 0; padding: 52px;">
                <pre style="font-weight: 800; font-size: 20px">Jaqueta de corrida Ferrari<h2 style="">RS$ 500,00</h2></pre>
                <form action="" style="display: flex; flex-direction: column; align-items: center;">
                    <div style="display: flex; justify-content: center; gap: 10px;">
                    <input type="radio" id="size_P" name="size" value="P">
                    <label for="size_P"> P </label>
                    <input type="radio" id="size_M" name="size" value="M">
                    <label for="size_M"> M </label>
                    <input type="radio" id="size_G" name="size" value="G">
                    <label for="size_G"> G </label>
                    </div><br><br>
                    <label for="product_quant"> Quantidade </label><br>
                    <input type="number" id="" name="product_quant" value="1" style="width: 80px; text-align: center;"><br><br>
                    <input type="submit" class="add_cart" value="Adicionar ao Carrinho">
                    
                </form>
           </div>
       </div>

    </body>
</html>
