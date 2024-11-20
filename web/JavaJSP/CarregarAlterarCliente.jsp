<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cliente"%>
<%
    Cliente cli = new Cliente();
    if (!(cli.statusSQL == null)) {
        out.println(cli.statusSQL);
    }
        String cliAlterar = request.getParameter("CpfCliente");
        cli.setCpf_cliente(cliAlterar);
        
        out.println();
       
           session.setAttribute("cpfOriginal", cliAlterar);

        String nomeCLi = "";
        String cpfCli = "";
        String numCli = "";
        String emailCli = "";
        String userCli = "";
        String senhaCli = "";
  

    if (cli.buscarClientePorCpf()) {
        nomeCLi = cli.getNome_cliente();
        cpfCli = cli.getCpf_cliente();
        numCli = cli.getNumero_cliente();
        emailCli = cli.getEmail_cliente();
        userCli = cli.getUsuario_cliente();
        senhaCli = cli.getSenha_cliente();

    } else {

        nomeCLi = "";
        cpfCli = "";
        numCli = "";
         emailCli = "";
          userCli = "";     
          senhaCli = "";
    }

  
%>

<div class="campo-par">
    <label for="nome" class="labelCadUsuario">Nome:</label>
    <input type="text" name="nomeClienteAlterar" class="inpCadUser" value="<%= nomeCLi %>" required>     

    <label for="text" class="labelCadUsuario">CPF:</label>
    <input type="text" name="cpfClienteAlterar" class="inpCadUser" maxlength="11"  pattern="\d{11}" oninvalid="this.setCustomValidity('Por favor, insira um CPF válido com 11 números sem pontos ou traços.')" oninput="this.setCustomValidity('')"  value="<%= cpfCli %>"  required>
</div>
<div class="campo-par">
    <label for="numero" class="labelCadUsuario">Numero:</label>
    <input type="text" name="numeroClienteAlterar" class="inpCadUser" maxlength="9"  pattern="\d{9}" oninvalid="this.setCustomValidity('Por favor, insira um Numero válido.')" oninput="this.setCustomValidity('')"  value="<%= numCli %>"  required>

    <label for="email" class="labelCadUsuario">Email:</label>
    <input type="email" name="emailClienteAlterar" class="inpCadUser"  value="<%= emailCli %>"  required>
</div>    
<div class="campo-par">
    <label for="usuario" class="labelCadUsuario">Usuario:</label>
    <input type="text" name="userClienteAlterar" class="inpCadUser" value="<%= userCli %>"  required>

    <label for="senhaUsuario" class="labelCadUsuario">Senha:</label>
    <input type="password" name="senhaClienteAlterar" class="inpCadUser" value="<%= senhaCli %>"  required>
</div>  

<button type="submit" class="botaoCadUser" onclick="window.location.assign('JavaJSP/AlterarCliente.jsp')" >Alterar</button>