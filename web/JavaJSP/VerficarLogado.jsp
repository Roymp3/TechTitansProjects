<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String userLogado = (String) session.getAttribute("funcionarioLogado");
   String Clientelog = (String) session.getAttribute("ClienteLogado");

   if (userLogado == null && Clientelog == null ) {
    
       response.sendRedirect("../login.html");
    }else{
     
        response.sendRedirect("../perfil.html");
        
    }

%>
