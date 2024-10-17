<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cliente"%>
<%
    Cliente cli = new Cliente();
   if ( !(cli.statusSQL == null) ) out.println(cli.statusSQL);
  
    
    
   String UsuarioLogado = (String) session.getAttribute("ClienteLogado");
   
  
      String nomeCliente = "";
     String emailCliente = "";
     String tellCliente ="";
   
   cli.setUsuario_cliente(UsuarioLogado);
   if ( cli.buscarClientePorUser() ) {
        
        nomeCliente = cli.getNome_cliente();
         emailCliente = cli.getEmail_cliente();
         tellCliente = cli.getNumero_cliente();
    
    }
    else{
    
        nomeCliente = "não encontrado";
       emailCliente = "não encontrado";
       tellCliente = "não encontrado";
    }
   
%>

<div class="form-group">
    <label for="name">Nome:</label>
    <input type="text" id="name" name="nome" value="<%=nomeCliente%>" readonly>
</div>
<div class="form-group">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%=emailCliente%>" readonly>
</div>
<div class="form-group">
    <label for="phone">Telefone:</label>
    <input type="tel" id="phone" name="cell" value="<%=tellCliente%>" readonly>
</div>
