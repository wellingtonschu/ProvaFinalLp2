<%
    String logado = (String) session.getAttribute("logado");
    if(logado==null){
        response.sendRedirect("login.jsp");
    }
%>