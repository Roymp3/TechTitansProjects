<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cliente"%>
<% 
   Cliente cli = new Cliente(); // Instancia o objeto Usuario
 if ( !(cli.statusSQL == null) ) 
        out.println(cli.statusSQL);
        
          String cpfORginal = (String) session.getAttribute("cpfOriginal");
          
          String mensageModal = "";
       
        String novoNome = request.getParameter("nomeClienteAlterar");
           String novoCpf = request.getParameter("cpfClienteAlterar");
           String novoNumero = request.getParameter("numeroClienteAlterar");
           String novoEmail = request.getParameter("emailClienteAlterar");
           String novoUsuario = request.getParameter("userClienteAlterar");
           String novaSenha = request.getParameter("senhaClienteAlterar");
        

        
       
if (novoNome == null || novoNumero == null || novoCpf == null || novoEmail == null || novoUsuario == null || novaSenha == null) {

     mensageModal = "Preencha os campos vazios!!";
    

    } else {
            cli.setNome_cliente(novoNome);
            cli.setCpf_cliente(novoCpf);
            cli.setEmail_cliente(novoEmail);
            cli.setNumero_cliente(novoNumero);
            cli.setUsuario_cliente(novoUsuario);
            cli.setSenha_cliente(novaSenha);

              cli.AlterarCliente(cpfORginal);

        if(!(cli.statusSQL == null)) {
            out.println(cli.statusSQL);
        } else {
            mensageModal = "Cliente Alterado com Sucesso!";
          

        }
    }
    
    response.sendRedirect("../AlterarCliente.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));


 
%>