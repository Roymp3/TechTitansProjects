<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Funcionarios"%>
<%
    Funcionarios func = new Funcionarios();
    if (!(func.statusSQL == null)) {
        out.println(func.statusSQL);
    }
        String funcAlterar = request.getParameter("funcionarioCPF");
        func.setCpf_funcionario(funcAlterar);
        
       
           session.setAttribute("cpfOriginal", funcAlterar);

      String nomeFunc = "";
        String cpfFunc = "";
        String rgFunc = "";
        String cargoFunc = "";
        String userFunc = "";
        String senhaFunc = "";
        Double salarioFunc = 0.0;

    if (func.buscarFuncPorCpf()) {
        nomeFunc = func.getNome_funcionario();
        cpfFunc = func.getCpf_funcionario();
        rgFunc = func.getRg_funcionario();
        cargoFunc = func.getCargo_funcionario();
        userFunc = func.getUsuario_funcionario();
        senhaFunc = func.getSenha_funcionario();
        salarioFunc = func.getSalario_funcionario();

    } else {

        nomeFunc = "";
        rgFunc = "";
        cpfFunc = "";
         userFunc = "";
          senhaFunc = "";     
    }

  
%>

<div class="campo-par">
    <label for="Nome">Nome:</label>
    <input type="text" id="txtNome" name="txtNomeAlterar" value="<%=nomeFunc %>" required>

    <label for="Cpf">CPF:</label>
    <input type="text" name="txtCpfAlterar" value="<%=cpfFunc %>" size="11" maxlength="11"  pattern="\d{11}" oninvalid="this.setCustomValidity('Por favor, insira um CPF válido com 11 números sem pontos ou traços.')" oninput="this.setCustomValidity('')"  required>
</div>

<div class="campo-par">
    <label for="Rg">RG:</label>
    <input type="text" name="txtRgAlterar" value="<%=rgFunc %>" size="12" maxlength="12" required>

    <label for="Cargo">Cargo:</label>
    <input type="text" name="txtCargoAlterar" value="<%= cargoFunc %>" size="12" required>
</div>

<div class="campo-par">
    <label for="Salario">Salário:</label>
    <input type="text" name="txtSalarioAlterar" value="<%= salarioFunc %>" size="12"  pattern="^\d+([.,]?\d+)?$" oninvalid="this.setCustomValidity('Por favor, insira um valor de salario válido.')" oninput="this.setCustomValidity('')"  required>

    <label for="UsuarioFunc">Usuário:</label>
    <input type="text" name="txtUserFuncAlterar" value="<%= userFunc %>" size="12" required>
</div>

<div class="campo-par">
    <label for="Senha">Senha:</label>
    <input type="password" name="txtSenhaFuncAlterar" value="<%= senhaFunc %>" size="12" required>

    <label class="empty-label"></label> <!-- Label vazia para manter o alinhamento -->
</div>

<button type="submit" class="evento-mouse" onclick="window.location.assign('JavaJSP/AlterarFunc.jsp')">Alterar</button>