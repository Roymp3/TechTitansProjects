<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cortes"%>
<%@page import="java.util.List" %>
<%
   Cortes corte = new Cortes();
   List<Cortes> listaCorte =corte.buscarCortes();

%>

<h2>Consultar corte</h2>
<%
       for(Cortes cortee: listaCorte) {
       
       
    %>
<div class="appointment">
   
    <div class="appointment-info">
        <p>Nome do corte: <%=cortee.getNome_corte()%></p>
        <p>Preço do corte:  <%=cortee.getPreco_corte()%> </p>
    </div>
    <button class="delete-button">&times;</button>
    <button class="edit-button"><i class="fas fa-pencil-alt"></i></button>

</div> 
 <%
       }
  %>
