<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="seguranca.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <style type="text/css">
            label{
                display: inline-block;
                width: 70px;
                text-align: right;
                margin-right: 5px
            }
        </style>
        <script src="js/bootstrap.min.js" type="text/html; charset=UTF-8"></script>
    </head>
    <body>
        <div class="container" style="width: 900px; margin: 0 auto; text-align: center">
            <ul class="nav nav-pills">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="hq_form.jsp">Adicionar HQ</a></li>
                <li><a href="hq_list.jsp">Listar HQs</a></li>
                <li><a href="editora_form.jsp">Adicionar Editora</a></li>
                <li><a href="editora_list.jsp">Listar Editoras</a></li>
                <li><a href="LogoutServlet">Sair</a></li>
            </ul>
            <div class="jumbotron">
                <div class="container">
                    <h1>Bem vindo ${logado}!</h1>
                    <p>
                        <img src="img/hqlogo.png" width="300">
                    </p>
                </div>
            </div>
        </div>      
    </body>
</html>
