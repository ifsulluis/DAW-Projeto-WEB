<%-- 
    Document   : formulario
    Created on : 14/09/2016, 21:32:08
    Author     : luis
--%>

<%@page import="br.edu.ifsul.dao.ReceituarioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="receituarioDao" scope="session"
             type="ReceituarioDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição dos receituarios</title>
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
        <h2>Edição dos medicamentos</h2>
        <h2><%=receituarioDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletReceituario" method="POST">
            Código: <input type="text" name="id" id="id"
                           value="<%= receituarioDao.getObjetoSelecionado().getId() == null
                           ? "" : receituarioDao.getObjetoSelecionado().getId() %>"
                           size="6" readonly /><br/>
            Posologia:  <input type="text" name="posologia" id="posologia"
                               value="<%= receituarioDao.getObjetoSelecionado().getPosologia()== null
                           ? "" : receituarioDao.getObjetoSelecionado().getPosologia()%>"
                           size="40" /><br/>            
            Validade:  <input type="text" name="validade" id="validade"
                               value="<%= receituarioDao.getObjetoSelecionado().getValidade()== null
                           ? "" : receituarioDao.getObjetoSelecionado().getValidade()%>"
                           size="40" /><br/>            
            
            
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/> 
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
