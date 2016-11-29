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
                <li><a href="editora_form.jsp">Adicionar Editora</a></li>
                <li class="active"><a href="#">Listar Editoras</a></li>
                <li><a href="LogoutServlet">Sair</a></li>
            </ul>
            <div class="jumbotron">
                <div class="container">
                    <h1>Lista de Editoras</h1>
                     <c:if test="${editoras==null}">
                        <h2>Lista vazia</h2>
                    </c:if>
                    <c:if test="${editoras!=null}">
                        <table class="table table-striped table-hover">
                            <caption>Listagem de Editoras</caption>
                            <thead>
                                <td>Id</td>
                                <td>Nome</td>
                            </thead>
                            <c:forEach items="${editoras}" var="e">
                                <tr>
                                    <td>${e.id}</td>
                                    <td>${e.nome}</td>
                                </tr>
                            </c:forEach>
                            <tfoot></tfoot>
                        </table>
                    </c:if>
                    <a class="btn btn-lg btn-primary" href="editoras_form.jsp">Novo</a>
                    <a class="btn btn-lg btn-danger" href="index.jsp">Cancelar</a>    
                </div>
            </div>
        </div>
    </body>
</html>
