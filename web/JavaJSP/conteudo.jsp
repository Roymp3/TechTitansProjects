<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    

    
    String nomeClasse = (String) session.getAttribute("nomeClasse");
    String cliente = (String) session.getAttribute("clientelog");
    String displayStyle = "style='display:none;'"; // Estilo padrão
    String displayLogin = "style='display:inline;'";
    String displayAdm = "style='display:inline;'";

    // Verifique se o usuário é um cliente e oculte o <li>
    if ("adm".equals(nomeClasse)) {
        displayStyle = "style='display:inline;'"; 
        displayLogin = "style='display:none;'";
        displayAdm = "style='display:none;'";
    }
    
    if("cliente".equals(cliente)){
    
       displayStyle = "style='display:none;'"; 
        displayLogin = "style='display:none;'";
    }
  
%>
 <ul>
     <li <%= displayLogin %>><a href="./login.html">Login</a></li>
       <li> <a href="./index.html">Home</a></li>
       <li <%= displayStyle %>> <a href="./Cadastro.html">Cadastro/Consulta</a></li>
        <li <%= displayAdm %>> <a href="JavaJSP/VerificarLogadoAgenda.jsp">Agendamento</a></li>
 </ul>
