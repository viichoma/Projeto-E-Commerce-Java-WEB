<%-- 
    Document   : admin_page
    Created on : 3 de jun. de 2024, 13:02:13
    Author     : unico
--%>

<%@page import="java.util.List"%>
<%@page import="VO.ProdutoVO"%>

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
        <script src="StyleScript/script.js"></script>
        <link rel="shortcut icon" type="imagex/png" href="./imagens/site_icon.ico">
    </head>
<body>
    
<style>
select {
  appearance: none; height: 30px; background-color: #ffffff; color: #2b2b2b; border: 0.5px solid #7a98e4;
  border-radius: 3px; box-shadow: 5px 5px #7a98e4; padding: 0 1em 0 0; margin: 0; width: 100%;
  font-family: inherit; font-size: inherit; cursor: inherit; line-height: inherit;
}
</style>
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
                    
    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'Adicionar') ">Adicionar</button>
        <button class="tablinks" onclick="openCity(event, 'Excluir')">Excluir</button>
        <button class="tablinks" onclick="openCity(event, 'Atualizar')">Atualizar</button>
    </div>
                    
    <div id="Adicionar" style="display: none;" class="tabcontent">   
        <div style="text-align: center">
            <form action="ProductController" method="post">
            <!-- Formulario para o ProductController efetuar ação de cadastrar produto -->
            <input type="hidden" name="acao" value="cadastrar">
            <h1 style=" font-size: 40px; color: #7a98e4; text-shadow:  1px 2px #6E69CA;">Adicionar Produto</h1>
            <p>Preencha os dados para adicionar um produto novo:</p><br>
                
            <div class="form-container">
                <div class="form-column">
                    <input type="text" name="nome_produto" placeholder="Nome do produto" required class="login_input">
                    <input type="text" name="ds_produto" placeholder="Descrição do produto" required class="login_input">
                    <input type="number" name="preco_produto" placeholder="Preço do produto" required class="login_input" step="0.01">
                    <input type="text" name="tamanho_produto" placeholder="Tamanho do produto" required class="login_input">
                </div>
                <div class="form-column">
                    <input type="text" name="categoria_produto" placeholder="Categoria do produto" required class="login_input">
                    <input type="text" name="genero_produto" placeholder="Gênero do produto" required class="login_input">
                    <input type="number" name="qnt_produto" placeholder="Quantidade" required class="login_input">
                    <input type="text" name="img_produto" placeholder="Nome da imagem" required class="login_input">
                </div>
            </div><br><br>
                    <input type="submit" class="submit_input">
            </form> 
        </div>
    </div>

    <div id="Excluir" style="display: none;" class="tabcontent">
        <div style="text-align: center">
            <h1 style="font-size: 40px; color: #7a98e4; text-shadow: 1px 2px #6E69CA;">Excluir Produto</h1>
            <p>Escolha um produto para excluir:</p><br>
            <div class="form-container">
                <div class="form-column">
                    <form action="ProductController" method="post">
                    <input type="hidden" name="acao" value="excluir">                      
       <!-- Listar produtos dentro de um select-list -->
            <%
                    List<ProdutoVO> produtos = (List<ProdutoVO>) request.getAttribute("listar");
                    if (produtos != null) {
                        out.println("<select name='produtoid'> class='select_list'");
                        for (ProdutoVO p : produtos) {
                            out.println("<option value='" + p.getId() + "'>" + p.getNome() + " - " + p.getId() + "</option>");
                        }
                        out.println("</select>");
                        }
            %><br><br>
                    <input type="submit" class="submit_input" value="Excluir">
                    </form>  
                </div>
            </div>
        </div>
    </div>


     <div id="Atualizar" style="display: none;" class="tabcontent">
        <div style="text-align: center">
            <h1 style="font-size: 40px; color: #7a98e4; text-shadow: 1px 2px #6E69CA;">Atualizar Produto</h1>
            <p>Escolha um produto para atualizar:</p><br>
            <div class="form-container">
                <div class="form-column">
                    <form action="ProductController" method="post">
                    <input type="hidden" name="acao" value="carregar">
            <%
                    produtos = (List<ProdutoVO>) request.getAttribute("listar");
                    if (produtos != null) {
                        out.println("<select name='produtoid'>");
                        for (ProdutoVO p : produtos) {
                            out.println("<option value='" + p.getId() + "'>" + p.getNome() + " - " + p.getId() + "</option>");
                        }
                        out.println("</select>");
                        }
            %><br><br>
                    <input type="submit" style="width: 180px" class="submit_input" value="Carregar Detalhes">
                    </form>  
                </div>
                    
                <form action="ProductController" method="post">
                <div class="form-container">
                    <div class="form-column">
                        <input type="hidden" name="acao" value="atualizar">
                        <input type="hidden" name="produtoid" value="<%= request.getAttribute("produtoid") %>">
                        <input type="text" name="nome_produto" placeholder="Nome do produto" required class="login_input" value="<%= request.getAttribute("nome_produto") %>">
                        <input type="text" name="ds_produto" placeholder="Descrição do produto" required class="login_input" value="<%= request.getAttribute("ds_produto") %>">
                        <input type="number" name="preco_produto" placeholder="Preço do produto" required class="login_input" step="0.01" value="<%= request.getAttribute("preco_produto") %>">
                        <input type="text" name="tamanho_produto" placeholder="Tamanho do produto" required class="login_input" value="<%= request.getAttribute("tamanho_produto") %>">
                        <input type="text" name="categoria_produto" placeholder="Categoria do produto" required class="login_input" value="<%= request.getAttribute("categoria_produto") %>">
                    </div>
                    <div class="form-column">
                        <input type="text" name="genero_produto" placeholder="Gênero do produto" required class="login_input" value="<%= request.getAttribute("genero_produto") %>">
                        <input type="number" name="qnt_produto" placeholder="Quantidade" required class="login_input" value="<%= request.getAttribute("qnt_produto") %>">
                        <input type="text" name="img_produto" placeholder="Nome da imagem" required class="login_input" value="<%= request.getAttribute("img_produto") %>">
                        <br><br>
                        <input type="submit" class="submit_input" value="Atualizar">
                    </div>
                </div>        
                </form> 
                        
            </div>
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