<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Funcionarios"%>
<% 
    Funcionarios func = new Funcionarios(); // Instancia o objeto Usuario
 if ( !(func.statusSQL == null) ) 
        out.println(func.statusSQL);
        
          String cpfORginal = (String) session.getAttribute("cpfOriginal");
          
          String mensageModal = "";
       
       String novoNome = request.getParameter("txtNomeAlterar");
           String novoCpf = request.getParameter("txtCpfAlterar");
           String novoRg = request.getParameter("txtRgAlterar");
           String novoCargo = request.getParameter("txtCargoAlterar");
           String novoSalario = request.getParameter("txtSalarioAlterar");
           String novoUsuario = request.getParameter("txtUserFuncAlterar");
           String novoSenha = request.getParameter("txtSenhaFuncAlterar");

        
       
if (novoNome == null || novoCargo == null || novoCpf == null || novoRg == null || novoSalario == null || novoUsuario == null || novoSenha == null) {

     mensageModal = "Preencha os campos vazios!";
    

    } else {
        Double salFunc = Double.parseDouble(novoSalario);
        func.setSalario_funcionario(salFunc);
           func.setNome_funcionario(novoNome);
           func.setCpf_funcionario(novoCpf);
           func.setRg_funcionario(novoRg);
           func.setCargo_funcionario(novoCargo);
           func.setUsuario_funcionario(novoUsuario);
           func.setSenha_funcionario(novoSenha);

        func.AlterarFunc(cpfORginal);

        if (!(func.statusSQL == null)) {
            out.println(func.statusSQL);
        } else {
            mensageModal = "Funcionario Alterado com Sucesso!";
          

        }
    }
    
    response.sendRedirect("../AlterarFunc.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));


 
%>