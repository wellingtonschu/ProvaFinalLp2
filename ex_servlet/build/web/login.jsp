<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
        <div class="container" style="width: 300px; hight: 100px; margin: 0 auto;">
            <h1 class="form-signin-heading">HQ Control</h1>
        </div>
         <div class="container" style="width: 175px; hight: 100px; margin: 0 auto;">
            <img src="img/hqlogo.png" width="175">
        </div>
        <div style="width: 400px; margin: 0 auto;">
            <h2 class="form-signin-heading">
                <%
                    String erro = request.getParameter("erro");
                    if((erro != null) && (erro.equalsIgnoreCase("1"))){
                        out.print("Login/senha inexistente");
                    }
                %>
            </h2>
        </div>
        <div class="container" style="width: 400px; margin: 0 auto;">
            <form class="form-signin" method="POST" action="LoginServlet">
                <h4>Login:</h4>
                <label class="sr-only" for="txtLogin">Login</label>
                <input class="form-control" id="txtLogin" autofocus="" required="" type="text" size="10" name="login">
                <h4>Senha:</h4>
                <label class="sr-only" for="txtSenha">Senha</label>
                <input class="form-control" id="txtSenha" required="" type="password" size="10" name="senha">
                <div class="checkbox">
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Logar</button>
            </form>
        </div>
    </body>
</html>
