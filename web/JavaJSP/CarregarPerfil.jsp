<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cliente"%>
<%@page import="javaBeans.Funcionarios"%>
<%
    Cliente cli = new Cliente();
    Funcionarios func = new Funcionarios();
   if ( !(cli.statusSQL == null) ) out.println(cli.statusSQL);
  
    
    
   String UsuarioLogado = (String) session.getAttribute("ClienteLogado");
      String FuncLogado = (String) session.getAttribute("funcionarioLogado");

   
   
   
  
      String dadoum = "";
     String dadodois = "";
     String dadotres ="";
     
      String tituloum = "";
     String titulodois = "";
     String titulotres ="";
   
   cli.setUsuario_cliente(UsuarioLogado);
   func.setUsuario_funcionario(FuncLogado);
   if ( cli.buscarClientePorUser() ) {
        
        dadoum = cli.getNome_cliente();
         dadodois = cli.getEmail_cliente();
         dadotres = cli.getNumero_cliente();
         
         tituloum = "Nome:";
         titulodois = "Email:";
         titulotres = "Telefone:";
    
    }else if(func.buscarFuncPorUser()){
        
      dadoum = func.getNome_funcionario();
         dadodois = func.getCargo_funcionario();
         dadotres = func.getRg_funcionario();
    
          tituloum = "Nome:";
         titulodois = "Cargo:";
         titulotres = "RG:";
    
    }
    else{
    
        dadoum = "não encontrado";
       dadodois = "não encontrado";
       dadotres = "não encontrado";
    }
     
   
%>

<div class="form-group">
    <label for="name"><%= tituloum %></label>
    <input type="text" id="name" name="nome" value="<%= dadoum %>" readonly>
</div>
<div class="form-group">
    <label for="email"><%= titulodois %></label>
    <input type="email" id="email" name="email" value="<%=dadodois%>" readonly>
</div>
<div class="form-group">
    <label for="phone"><%= titulotres %></label>
    <input type="tel" id="phone" name="cell" value="<%=dadotres%>" readonly>
</div>
