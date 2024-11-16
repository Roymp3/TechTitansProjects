<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
        String logado = (String) session.getAttribute("logadoo");
    if("logado".equalsIgnoreCase(logado))
    {
       response.sendRedirect("../perfil.html");
   
    }else{
    
        response.sendRedirect("../login.html");
    }
%>
