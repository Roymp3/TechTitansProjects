<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    

    String displayStyle = "style='display:none;'"; // Estilo padrão   

    String logado = (String) session.getAttribute("logadoo");
    if("logado".equalsIgnoreCase(logado))
    {
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
