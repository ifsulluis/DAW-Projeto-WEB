<%-- 
    Document   : listar
    Created on : 14/09/2016, 20:35:45
    Author     : luis
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifsul.modelo.Paciente"%>
<%@page import="br.edu.ifsul.dao.PacienteDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pacienteDao" scope="session"
             type="PacienteDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de pacientes</title>
    </head>
    <body>
        <a href="../index.html">In�cio</a>
        <h2>Pacientes</h2>
        <h2><%=pacienteDao.getMensagem()%></h2>
        <a href="ServletPaciente?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Nascimento</th>
                    <th>Telefone</th>
                    <th>Sexo</th>
                    <th>Historico</th>
                    <th>Peso</th>
                    <th>Altura</th>
                    
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(Paciente c : pacienteDao.getLista()){  // inicio do la�o de repeti��o                  
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                    
                   <td><%=c.getNascimento()== null
                           ? "" : new SimpleDateFormat("dd/MM/yyyy").format(c.getNascimento().getTime())%></td>
                   
                    <td><%=c.getTelefone()%></td>
                    <td><%=c.getSexo()%></td>
                    <td><%=c.getHistorico()%></td>
                    <td><%=c.getPeso()%></td>
                    <td><%=c.getAltura()%></td>
                   
                    <td><a href="ServletPaciente?acao=alterar&id=<%=c.getId()%>">Alterar</a></td>
                    <td><a href="ServletPaciente?acao=excluir&id=<%=c.getId()%>">Excluir</a></td>
                </tr>
                <%
                    } // fim do la�o de repeti��o
                %>
                    
            </tbody>
        </table>
    </body>
</html>
