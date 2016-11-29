<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="seguranca.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <li><a href="index.jsp">Home</a></li>
                <li><a href="hq_form.jsp">Adicionar HQ</a></li>
                <li><a href="hq_list.jsp">Listar HQs</a></li>
                <li class="active"><a href="#">Adicionar Editora</a></li>
                <li><a href="editora_list.jsp">Listar Editoras</a></li>
                <li><a href="LogoutServlet">Sair</a></li>
            </ul>
            <div class="jumbotron">
                <div class="container">
                    <h1>Formulário de Editora</h1>
                    <form action="EditorasServlet" method="POST">
                        <label for="txtNome">Nome</label>
                        <input id="txtNome" name="nome"/>
                        <br/>
                        <label for="txtId">Id</label>
                        <input id="txtId" name="id"/>
                        </br>
                        <button type="submit" class="btn btn-success">OK</button>
                        <button type="reset" class="btn btn-warning">Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
