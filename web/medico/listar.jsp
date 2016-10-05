<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:45
    Author     : jorge
--%>

<%@page import="br.edu.ifsul.modelo.Medico"%>
<%@page import="br.edu.ifsul.dao.MedicoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="medicoDao" scope="session"
             type="MedicoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de medicos</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h2>Médicos</h2>
        <h2><%=medicoDao.getMensagem()%></h2>
        <a href="ServletMedico?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>CRM</th>
                    <th>Especialidade</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(Medico c : medicoDao.getLista()){  // inicio do laço de repetição                  
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getCrm()%></td>
                    <td><%=c.getEspecialidade().getDescricao()%></td>
                    <td><a href="ServletMedico?acao=alterar&id=<%=c.getId()%>">Alterar</a></td>
                    <td><a href="ServletMedico?acao=excluir&id=<%=c.getId()%>">Excluir</a></td>
                </tr>
                <%
                    } // fim do laço de repetição
                %>
                    
            </tbody>
        </table>
    </body>
</html>
