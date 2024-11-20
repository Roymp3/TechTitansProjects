<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="java.util.List" %>
<%
   Funcionarios func = new Funcionarios();
   List<Funcionarios> listaFunc = func.buscarFuncionarios();

%>

<h2>Consultar Funcionário</h2>
<%  
    try{
    
     for(Funcionarios funcc : listaFunc){
    
   

%>
<div class="appointment">
    <div class="appointment-info">
        <div class="frmConsulta">
            <label for="nameFuncionario">Nome do funcionário:</label>
            <input type="text" id="nameFuncionario" name="nomeFuncinario" value="<%=funcc.getNome_funcionario()%>" readonly>

            <label for="cpfFuncionario">CPF do funcionário:</label>
            <input type="text" id="cpfFuncionario" name="funcionarioCPF" value="<%=funcc.getCpf_funcionario()%>" readonly>

            <label for="funcionarioRg">RG do funcionário:</label>
            <input type="text" id="funcionarioRg" name="RgFuncionario" value="<%=funcc.getRg_funcionario()%>" readonly>

            <label for="cargoFuncionario">Cargo do funcionário:</label>
            <input type="text" id="cargoFuncionario" name="funcionarioCargo" value="<%=funcc.getCargo_funcionario()%>" readonly>

            <label for="salarioFuncionario">Salário do funcionário:</label>
            <input type="number" id="salarioFuncionario" name="funcionarioSalario" value="<%=funcc.getSalario_funcionario()%>" readonly>
        </div>
    </div>
        <button class="delete-button" onsubmit="showModal()" onclick="window.location.assign('JavaJSP/DeletarFunc.jsp?funcionarioCPF=<%=funcc.getCpf_funcionario()%>')">&times;</button>
        <button class="edit-button" onclick="window.location.assign('./AlterarFunc.html?funcionarioCPF=<%=funcc.getCpf_funcionario() %>')" ><i class="fas fa-pencil-alt"></i></button> <!-- Botão de editar -->
</div>

<%
    }
}catch(Exception err){
   out.print("ocorreu um erro inesperado,contate o suporte" + err.getMessage() );

}

%>

