<%-- 
    Document   : enviadados
    Created on : 2 de jun. de 2024, 16:26:38
    Author     : unico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Lista os produtos automaticamente ao inicar o projeto -->
<%
    response.sendRedirect("ProductController?acao=listar");
%>
