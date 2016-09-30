<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:45
    Author     : jorge
--%>

<%@page import="br.edu.ifsul.modelo.Especialidade"%>
<%@page import="br.edu.ifsul.dao.EspecialidadeDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="especialidadeDao" scope="session"
             type="EspecialidadeDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem das Especialidades</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Especialidades</h2>
        <h2><%=especialidadeDao.getMensagem()%></h2>
        <a href="ServletEspecialidade?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descrição</th>
                    
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                  for(Especialidade e :especialidadeDao.getLista() )  {
                %>  
                <tr>
                    <td><%=e.getId()%></td>
                    <td><%=e.getDescricao()%></td>
                    
                    <td><a href="ServletEspecialidade?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
                    <td><a href="ServletEspecialidade?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>    
                    
            </tbody>
        </table>
    </body>
</html>
