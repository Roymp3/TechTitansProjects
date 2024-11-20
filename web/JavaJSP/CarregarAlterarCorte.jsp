<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cortes"%>
<%
    Cortes corte = new Cortes();
    if (!(corte.statusSQL == null)) {
        out.println(corte.statusSQL);
    }
        String CorteAlterar = request.getParameter("corteNome");
        corte.setNome_corte(CorteAlterar);

      session.setAttribute("nomeCorte", CorteAlterar);

       String nomeCorte = "";
        Double precoCorte = 0.0;
    

    if (corte.buscarCortePorNome()) {
        nomeCorte = corte.getNome_corte();
        precoCorte = corte.getPreco_corte();


    } 
  
%>


<label for="text" class="labelCadUsuario">Nome:</label>
<input type="text" id="funcNome" name="nomeCorteAlterar" class="inpCadUser" value="<%= nomeCorte %>" required>     

<label for="text" class="labelCadUsuario">Valor</label>
<input type="text" name="valorCorteAlterar" class="inpCadUser" value="<%= precoCorte %>" pattern="^\d+([.,]?\d+)?$" oninvalid="this.setCustomValidity('Por favor, insira um valor valido de salario.')" oninput="this.setCustomValidity('')" required>


<button type="submit" class="botaoCadUser" onclick="window.location.assign('JavaJSP/AlterarCorte.jsp')">Alterar</button>