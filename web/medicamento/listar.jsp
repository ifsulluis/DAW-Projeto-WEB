<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:45
    Author     : luis
--%>

<%@page import="br.edu.ifsul.modelo.Medicamento"%>
<%@page import="br.edu.ifsul.dao.MedicamentoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="medicamentoDao" scope="session"
             type="MedicamentoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de Medicamentos</title>
    </head>
    <body>
        <a href="../index.html">Inicio</a>
        <h2>Medicamentos</h2>
        <h2><%=medicamentoDao.getMensagem()%></h2>
        <a href="ServletMedicamento?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <%
                  for(Medicamento e :medicamentoDao.getLista() )  {
                %>  
                <tr>
                    <td><%=e.getId()%></td>
                    <td><%=e.getNome()%></td>
                    
                    <td><a href="ServletMedicamento?acao=alterar&id=<%=e.getId()%>">Alterar</a></td>
                    <td><a href="ServletMedicamento?acao=excluir&id=<%=e.getId()%>">Excluir</a></td>
                </tr>
                <%
                    }
                %>    
                    
            </tbody>
        </table>
    </body>
</html>
