<%@page import="javaBeans.Cliente"%>
<%@page import="javaBeans.Funcionarios"%>
<%

     String usuario_cliente = request.getParameter("user_cliente"); // Captura usuário do form
    String password_cliente = request.getParameter("password_cliente"); // Captura password_cliente do form (nome correto no HTML)

    Cliente user = new Cliente(); // Instancia Usuario
    Funcionarios func = new Funcionarios();
    
    if (usuario_cliente != null && password_cliente != null && !usuario_cliente.isEmpty() && !password_cliente.isEmpty()) {
        // Usa os setters para definir o usuário e a password_cliente
        user.setUsuario_cliente(usuario_cliente); 
        user.setSenha_cliente(password_cliente);
        func.setUsuario_funcionario(usuario_cliente);
        func.setSenha_funcionario(password_cliente);
        
        // Verifica o login
        if (user.getLogin()) { 
        
          response.sendRedirect("../index.html"); // Carrega a página de sistema em caso de sucesso
        } else if(func.getLogin()) {
            String nomeClasse = "adm";
            session.setAttribute("nomeClasse", nomeClasse);
             response.sendRedirect("../Cadastro.html"); // Carrega a página de sistema em caso de sucesso

        }else{
        String sHTML = "<center>A senha ou usuario não foram encontrados!<br>" +
                       "<a href='../index.html'> Voltar </a></center>";
        out.println(sHTML); // Exibe mensagem se os campos estiverem vazios
    }   
    } else {
        String sHTML = "<center>A senha ou usuario não podem ser vazios!<br>" +
                       "<a href='../index.html'> Voltar </a></center>";
        out.println(sHTML); // Exibe mensagem se os campos estiverem vazios
    }
    
%>
