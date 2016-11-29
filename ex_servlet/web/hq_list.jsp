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
                <li class="active"><a href="#">Listar HQs</a></li>
                <li><a href="editora_form.jsp">Adicionar Editora</a></li>
                <li><a href="editora_list.jsp">Listar Editoras</a></li>
                <li><a href="LogoutServlet">Sair</a></li>
            </ul>
            <div class="jumbotron">
                <div class="container">
                    <h1>Lista de HQs</h1>
                     <c:if test="${hqs==null}">
                        <h2>Lista vazia</h2>
                    </c:if>
                    <c:if test="${hqs!=null}">
                        <table class="table table-striped table-hover">
                            <caption>Listagem de HQs</caption>
                            <thead>
                                <td>Id</td>
                                <td>Titulo</td>
                                <td>Qtde. Páginas</td>
                            </thead>
                            <c:forEach items="${hqs}" var="h">
                                <tr>
                                    <td>${h.id}</td>
                                    <td>${h.titulo}</td>
                                    <td>${h.paginas}</td>
                                </tr>
                            </c:forEach>
                            <tfoot></tfoot>
                        </table>
                    </c:if>
                    <a class="btn btn-lg btn-primary" href="hq_form.jsp">Novo</a>
                    <a class="btn btn-lg btn-danger" href="index.jsp">Cancelar</a>    
                </div>
            </div>
        </div>
    </body>
</html>
