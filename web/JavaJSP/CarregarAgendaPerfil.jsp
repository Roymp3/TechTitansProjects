<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cliente"%>
<%@page import="javaBeans.Funcionarios"%>
<%
    Cliente cli = new Cliente();
    Funcionarios func = new Funcionarios();
   if ( !(cli.statusSQL == null) ) out.println(cli.statusSQL);
  
    
    
   String UsuarioLogado = (String) session.getAttribute("ClienteLogado");
      String FuncLogado = (String) session.getAttribute("funcionarioLogado");

     
      String titulo = "";
 
   
   cli.setUsuario_cliente(UsuarioLogado);
   func.setUsuario_funcionario(FuncLogado);
   if ( cli.buscarClientePorUser() ) {
        

         titulo = "Barbeiro Selecionado:";
       
    
    }else if(func.buscarFuncPorUser()){

    
          titulo = "Cliente:";
        
    }
   
%>

<p>Data e Hora: </p>
<p><%= titulo %></p>
<p>Corte Escolhido:</p>
<p>Forma de Pagamento:</p>
<p>Status:</p>
