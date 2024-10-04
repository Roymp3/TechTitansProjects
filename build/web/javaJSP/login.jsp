<%@ page import="javaBeans.Usuario" %>
<%
    String usuario_cliente = request.getParameter("usuario_cliente"); // Captura usuário do form
    String password_cliente = request.getParameter("password_cliente"); // Captura password_cliente do form (nome correto no HTML)

    Usuario user = new Usuario(); // Instancia Usuario
    
    if (usuario_cliente != null && password_cliente != null && !usuario_cliente.isEmpty() && !password_cliente.isEmpty()) {
        // Usa os setters para definir o usuário e a password_cliente
        user.setUsuarioCliente(usuario_cliente); 
        user.setPasswordCliente(password_cliente);
        
        // Verifica o login
        if (user.getLogin()) { 
            response.sendRedirect("sistema.jsp"); // Carrega a página de sistema em caso de sucesso
        } else {
            String sHTML = "<center>Opa! Login ou password_cliente não encontrados! Tente novamente!<br>" +
                           "<a href='../index.html'> Voltar </a></center>";
            out.println(sHTML); // Exibe mensagem de erro de login
        }
    } else {
        String sHTML = "<center>Os campos não podem ser vazios!<br>" +
                       "<a href='../index.html'> Voltar </a></center>";
        out.println(sHTML); // Exibe mensagem se os campos estiverem vazios
    }
%>