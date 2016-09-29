<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:45
    Author     : luis
--%>

<%@page import="br.edu.ifsul.modelo.Receituario"%>
<%@page import="br.edu.ifsul.dao.ReceituarioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="receituarioDao" scope="session"
             type="ReceituarioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Receituario</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Receituarios</h2>
        <h2><%=receituarioDao.getMensagem()%></h2>
        <a href="ServletReceituario?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Posologia</th>
                    <th>Validade</th>
                    
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                  for(Receituario e : receituarioDao.getLista() )  {
                %>  
                <tr>
                    <td><%=e.getId()%></td>
                    <td><%=e.getPosologia()%></td>
                    <td><%=e.getValidade()%></td>
                    
                    <td><a href="ServletReceituario?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
                    <td><a href="ServletReceituario?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>    
                    
            </tbody>
        </table>
    </body>
</html>
