<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cliente"%>
<%@page import="javaBeans.Funcionarios"%>
<%

    String usuario_cliente = request.getParameter("user_cliente"); // Captura usu�rio do form
    String password_cliente = request.getParameter("password_cliente"); // Captura password_cliente do form (nome correto no HTML)

  
    String mensageModal = "";
//    session.removeAttribute("ClienteLogado");
    
    
    String log = "deslogado";

    
    Cliente user = new Cliente(); // Instancia Usuario
    Funcionarios func = new Funcionarios();
    
      
    
    if (usuario_cliente != null && password_cliente != null && !usuario_cliente.isEmpty() && !password_cliente.isEmpty()) {
        // Usa os setters para definir o usu�rio e a password_cliente
        user.setUsuario_cliente(usuario_cliente); 
        user.setSenha_cliente(password_cliente);
        func.setUsuario_funcionario(usuario_cliente);
        func.setSenha_funcionario(password_cliente);
        
         
        
        // Verifica o login
        if (user.getLogin()) { 
           session.setAttribute("ClienteLogado", usuario_cliente);
            String cliente = "cliente";
            session.setAttribute("clientelog", cliente);
            
            log = "logado";
             session.setAttribute("logadoo", log);
          
            response.sendRedirect("../index.html"); // Carrega a p�gina de sistema em caso de sucesso
            return;
        } else if(func.getLogin()) {
            String nomeClasse = "adm";
            session.setAttribute("nomeClasse", nomeClasse);
             log = "logado";
             session.setAttribute("logadoo", log);
            session.setAttribute("funcionarioLogado",usuario_cliente);
             response.sendRedirect("../Cadastro.html"); // Carrega a p�gina de sistema em caso de sucesso
             return;
        }else{
        mensageModal = "A senha ou usuario n�o foram encontrados!";
                 
         // Exibe mensagem se os campos estiverem vazios
    }   
    } else {
        mensageModal= "N�o deixe campos vazios!";
                      
         // Exibe mensagem se os campos estiverem vazios
    }
     response.sendRedirect("../login.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));
%>


