<%@page import="javaBeans.Usuario"%>
<%  
    String email = request.getParameter("email"); // captura email do form 
    String senha = request.getParameter("senha"); // captura senha do form 
     
    Usuario user = new Usuario();// instancia Usuario
    
    user.email = email ; // mude para user.setEmail(email);
    user.senha = senha;  // mude para user.setSenha(senha);
 
   if ( user.getLogin()== true ) { // faz o login no objeto user
        response.sendRedirect("sistema.jsp");// carrega a página de sistema
    } else {
       String sHTML="<center>ERRO! Usuário não encontrado ou Senha inválida!<br>"
       + "<a href = '../index.html'> Voltar </a></center>";
       out.println(sHTML);
    }
 
%>