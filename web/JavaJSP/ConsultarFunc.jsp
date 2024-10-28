<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="java.util.List" %>
<%
   Funcionarios func = new Funcionarios();
   List<Funcionarios> listaFunc = func.buscarFuncionarios();

%>

<h2>Consultar Funcionário</h2>
<%
    for(Funcionarios funcc : listaFunc){

%>
<div class="appointment">

    <div class="appointment-info">
        <p>Nome do funcionário: <%=funcc.getNome_funcionario() %> </p>
        <p>CPF do funcionário: <%=funcc.getCpf_funcionario() %> </p>
        <p>RG do funcionário:  <%=funcc.getRg_funcionario() %></p>
        <p>Cargo do funcionário:  <%=funcc.getCargo_funcionario() %></p>
        <p>Salário do funcionário: <%=funcc.getSalario_funcionario() %></p>
    </div>
    <button class="delete-button">&times;</button>
    <button class="edit-button"><i class="fas fa-pencil-alt"></i></button>
</div>

<%
    }

%>

