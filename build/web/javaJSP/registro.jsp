<%@page import="javaBeans.Usuario"%>
<% 
    Usuario user = new Usuario(); // Instancia o objeto Usuario
    
    // preenche os atributos do objeto usuario com os parâmetros do formulário
    user.nome_cliente = request.getParameter("nome_cliente");
    user.sobrenome_cliente = request.getParameter("sobrenome_cliente");
    user.cpf_cliente = request.getParameter("cpf_cliente");
    user.numero_cliente = request.getParameter("numero_cliente");
    user.usuario_cliente = request.getParameter("usuario_cliente");
    user.password_cliente = request.getParameter("password_cliente");
    
    // chama o método para fazer a inclusão no banco de dados
    user.incluir(); 
    
    if (user.statusSQL == null) {
        String sHTML = "<center>Usuário criado com Sucesso!<br>" + "<a href = '../index.html'> Voltar </a></center>";
        out.println(sHTML);
    } else {
        out.println(user.statusSQL); // Exibe a mensagem de erro, se houver
    }
%>