<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cliente"%>
<%
   String userLogado = (String) session.getAttribute("funcionarioLogado");
   if (userLogado == null) {
        userLogado = "";
          
    }

%>

<label for="nome" class="labelCadUsuario">Funcionario:</label>
 <input type="text" name="nomeFunc" class="inpCadUser" value="<%=userLogado%>" readonly>     
            
  <label for="text" class="labelCadUsuario">Selecione o dia e a data disponivel:</label>
  <input type="date" name="dataHora" class="inpCadUser" placeholder="insira o valor do corte" required>

 <button type="submit" class="botaoCadUser" onclick="window.location.assign('JavaJSP/RegistroHora.jsp')">Enviar</button>
