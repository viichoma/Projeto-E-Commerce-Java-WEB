<%-- 
    Document   : admin_page
    Created on : 3 de jun. de 2024, 13:02:13
    Author     : unico
--%>

<%@page import="java.util.List"%>
<%@page import="VO.ProdutoVO"%>
<%      
    session = request.getSession();
    Integer userId = (Integer) session.getAttribute("userId");
    String userEmail = (String) session.getAttribute("email");
    if ((userEmail.equals("vi@admin.com")) && (userEmail != null) && (userId != null)) {

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
    <script>
        function openCity(evt, cityName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
        </script>
    
    <style>
            .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            text-align: center;
            padding: 20px;
        }
        .form-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .form-column {
            display: flex;
            flex-direction: column;
            gap: 10px;
            
            /* Style the tab */
        }
            /* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons that are used to open the tab content */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
  height: 750px;
}
   </style>
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
                    
            <div class="tab">
                <button class="tablinks" onclick="openCity(event, 'Adicionar') ">Adicionar</button>
                <button class="tablinks" onclick="openCity(event, 'Excluir')">Excluir</button>
                <button class="tablinks" onclick="openCity(event, 'Atualizar')">Atualizar</button>
            </div>
                    
        <div id="Adicionar" style="display: none;" class="tabcontent">
            
            <div style="text-align: center">
                <form action="ProductController" method="post">
                <!-- Se a ação for register, o LoginController efetua a funçao de gravar -->
                <input type="hidden" name="acao" value="cadastrar">
                
                <h1 style=" font-size: 40px; color: #7a98e4; text-shadow:  1px 2px #6E69CA;">Adicionar Produto</h1>
                <p>Preencha os dados para adicionar um produto novo:</p><br>
                
            <div class="form-container">
                <div class="form-column">
                    <input type="text" name="nome_produto" placeholder="Nome do produto" required class="login_input">
                    <input type="text" name="ds_produto" placeholder="Descrição do produto" required class="login_input">
                    <input type="number" name="preco_produto" placeholder="Preço do produto" required class="login_input">
                    <input type="text" name="tamanho_produto" placeholder="Tamanho do produto" required class="login_input">
                </div>
                <div class="form-column">
                    <input type="text" name="categoria_produto" placeholder="Categoria do produto" required class="login_input">
                    <input type="text" name="genero_produto" placeholder="Gênero do produto" required class="login_input">
                    <input type="number" name="qnt_produto" placeholder="Quantidade" required class="login_input">
                    <input type="text" name="img_produto" placeholder="Nome da imagem" required class="login_input">
                    <!--<input type="file" name="imagem_produto" id="" accept=".jpeg, .jpg, .png, .webp">-->
                </div>
            </div>
                <br><br><input type="submit" class="submit_input">
                </form> 
             </div>
        </div>

         <div id="Excluir" style="display: none;" class="tabcontent">
            
            <div style="text-align: center">
                <form action="ProductController" method="post">
                <!-- Se a ação for register, o LoginController efetua a funçao de gravar -->
                <input type="hidden" name="acao" value="excluir">
                
                <h1 style=" font-size: 40px; color: #7a98e4; text-shadow:  1px 2px #6E69CA;">Excluir Produto</h1>
                <p>Preencha os dados para adicionar um produto novo:</p><br>
                
            <div class="form-container">
                <div class="form-column">
                    <input type="text" name="nome_produto" placeholder="Nome do produto" required class="login_input">
                    <input type="text" name="ds_produto" placeholder="Descrição do produto" required class="login_input">
                    <input type="number" name="preco_produto" placeholder="Preço do produto" required class="login_input">
                    <input type="text" name="tamanho_produto" placeholder="Tamanho do produto" required class="login_input">
                </div>
                <div class="form-column">
                    <input type="text" name="categoria_produto" placeholder="Categoria do produto" required class="login_input">
                    <input type="text" name="genero_produto" placeholder="Gênero do produto" required class="login_input">
                    <input type="number" name="qnt_produto" placeholder="Quantidade" required class="login_input">
                    <input type="text" name="img_produto" placeholder="Nome da imagem" required class="login_input">
                    <!--<input type="file" name="imagem_produto" id="" accept=".jpeg, .jpg, .png, .webp">-->
                </div>
            </div>
                <br><br><input type="submit" class="submit_input">
                </form> 
             </div>
        </div>            

        <div id="Atualizar" style="display: none;" class="tabcontent">
            
            <div style="text-align: center">
                <form action="ProductController" method="post">
                <!-- Se a ação for register, o LoginController efetua a funçao de gravar -->
                <input type="hidden" name="acao" value="atualizar">
                
                <h1 style=" font-size: 40px; color: #7a98e4; text-shadow:  1px 2px #6E69CA;">Atualizar Produto</h1>
                <br>
                
            <div class="">

             </div>
        </div> 
                    
    </body>
</html>

<%  
    } 
    else {
        response.sendRedirect("ProductController?acao=listar");
    }   
%>