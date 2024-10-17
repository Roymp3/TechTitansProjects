<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    

    
    String nomeClasse = (String) session.getAttribute("nomeClasse");
    String displayStyle = "style='display:none;'"; // Estilo padrão

    // Verifique se o usuário é um cliente e oculte o <li>
    if ("adm".equals(nomeClasse)) {
        displayStyle = "style='display:inline;'"; 
    }
  
%>
 <ul>
     <li><a href="./login.html">Login</a></li>
       <li> <a href="./index.html">Home</a></li>
       <li <%= displayStyle %>> <a href="./Cadastro.html">Cadastro/Consulta</a></li>
        <li> <a href="./Pagamento.html">Agendamento</a></li>
 </ul>
