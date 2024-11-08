<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    
    
    String nomeClasse = (String) session.getAttribute("nomeClasse");
    String cliente = (String) session.getAttribute("clientelog");
    String displayStyle = "style='display:none;'"; // Estilo padrão

    // Verifique se o usuário é um cliente e oculte o <li>
    if ("adm".equals(nomeClasse)) {
        displayStyle = "style='display:inline;'"; 
       
    }
    
    if("cliente".equals(cliente)){
         displayStyle = "style='display:inline;'"; 
    }
    
   
    
            
%>
<div class="logo">
    <i class="fas fa-cut"></i>
    Na Régua
</div>
<div class="social-icons">
    <a href="#"><i class="fab fa-facebook"></i></a>
    <a href="#"><i class="fab fa-whatsapp"></i></a>
    <a href="#"><i class="fab fa-instagram"></i></a>
    <a href="JavaJSP/VerficarLogado.jsp" ><i class="fas fa-user"></i></a>
    <a href="JavaJSP/Logout.jsp" title="Logout"><i class="fas fa-sign-out-alt" <%= displayStyle %>></i></a>
</div>
