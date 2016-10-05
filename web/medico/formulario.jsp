<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:08
    Author     : luis
--%>

<%@page import="br.edu.ifsul.modelo.Especialidade"%>
<%@page import="br.edu.ifsul.dao.EspecialidadeDAO"%>
<%@page import="br.edu.ifsul.dao.MedicoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="medicoDao" scope="session"
             type="MedicoDAO"/>
<jsp:useBean id="especialidadeDao" scope="session"
             type="EspecialidadeDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Medicos</title>
        <script>
            function doSalvar(){
                document.getElementById("acao").value = 'salvar';
                document.getElementById("form").submit();
            }
            function doCancelar(){
                document.getElementById("acao").value = 'cancelar';
                document.getElementById("form").submit();
            }            
        </script>                        
    </head>
    <body>
        <h1>Edição de Medicos</h1>
        <h2><%=medicoDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletMedico" method="POST">
            Código: <input type="text" name="id"
                           value="<%= medicoDao.getObjetoSelecionado().getId() == null
                                   ? "" : medicoDao.getObjetoSelecionado().getId() %>" size="6"
                                   readonly />
            <br/>CRM: <input type="text" name="crm"
                           value="<%= medicoDao.getObjetoSelecionado().getCrm()== null
                                   ? "" : medicoDao.getObjetoSelecionado().getCrm() %>" size="40"/> 
            <br/>Especialidade: 
            <select name="idEspecialidade" id="idEspecialidade">
                <%
                  for (Especialidade e : especialidadeDao.getLista())  {
                      String selected = "";
                      if (medicoDao.getObjetoSelecionado().getEspecialidade() != null){
                        if(medicoDao.getObjetoSelecionado().getEspecialidade().getId().equals(e.getId())){
                            selected = "selected";
                        }                  
                      }
                %>    
                    <option value="<%=e.getId()%>" <%=selected%> > <%=e.getDescricao()%> </option>
                <%
                  }  
                %>                        
            </select>
            <br/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
