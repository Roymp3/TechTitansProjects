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
                        <div class="frmConsulta">
                            <label for="nomeCorte">Nome do corte:</label>
                            <input type="text" id="nomeCorte" name="corteNome" value="<%=cortee.getNome_corte()%>" readonly>

                            <label for="precoCorte">Preço do corte:</label>
                            <input type="text" id="precoCorte" name="cortePreco" value="<%=cortee.getPreco_corte()%>" readonly>
                        </div>
                    </div>
                        <button class="delete-button" onclick="window.location.assign('JavaJSP/DeletarCorte.jsp?corteNome=<%=cortee.getNome_corte()%>')">&times;</button>
                        <button class="edit-button"><i class="fas fa-pencil-alt"></i></button>
                </div>
    </div>
 <%
       }
  %>
