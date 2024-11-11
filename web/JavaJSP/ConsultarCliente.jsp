<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cliente"%>
<%@page import="java.util.List" %>
<%
   Cliente cli = new Cliente();
   List<Cliente> listaCliente = cli.buscarCliente();

%>

<h2>Consultar cliente</h2>
<%
    for(Cliente cliente :listaCliente){

%>

<div class="appointment">
    <div class="appointment-info">
        <div class="frmConsulta">
            <label for="clientName">Nome do cliente:</label>
            <input type="text" id="clientName" name="nomeCliente" value="<%= cliente.getNome_cliente()%>" readonly>

            <label for="clientEmail">Email do cliente:</label>
            <input type="text" id="emailName" name="nomeCliente"  value="<%= cliente.getEmail_cliente()%>" readonly>

            <label for="clientUser">Usuário do Cliente:</label>
            <input type="text" id="clientUser" name="nomeUsuario" value="<%= cliente.getUsuario_cliente()%>" readonly>

            <label for="clientPhone">Número do cliente:</label>
            <input type="tel" id="clientPhone" name="telefoneCliente" value="<%= cliente.getNumero_cliente()%>" readonly>

            <label for="clientCPF">CPF do cliente:</label>
            <input type="text" id="clientCPF" name="CpfCliente" value="<%= cliente.getCpf_cliente()%>" readonly>
        </div>
    </div>
    <button class="delete-button" onclick="window.location.assign('JavaJSP/DeletarCliente.jsp?CpfCliente=<%=cliente.getCpf_cliente()%>')" >&times;</button>
    <button class="edit-button"  onclick="window.location.assign('./AlterarCliente.html?CpfCliente=<%=cliente.getCpf_cliente()%>')"><i class="fas fa-pencil-alt"></i></button> <!-- Botão de editar -->
</div>

<%
 
    }
      

%>

