<%@page import="javaBeans.Cliente"%>
<% Cliente user = new Cliente(); // Instancia o objeto Usuario
 if ( !(user.statusSQL == null) ) out.println(user.statusSQL);
 
  String nomeCliente = request.getParameter("nomeCliente");
  String cpfCliente = request.getParameter("cpfCliente");
  String numeroCliente = request.getParameter("numeroCliente");
   String usuarioCliente = request.getParameter("userCliente");
   String senhaCliente = request.getParameter("senhaCliente");
    String emailCliente = request.getParameter("emailCliente");

 
 // preenche os atributos do objeto usuario
 user.setNome_cliente(nomeCliente);
 user.setCpf_cliente(cpfCliente);
 user.setNumero_cliente(numeroCliente);
 user.setUsuario_cliente(usuarioCliente);
 user.setSenha_cliente(senhaCliente);
 user.setEmail_cliente(emailCliente);
 
 if(nomeCliente ==null || cpfCliente == null || numeroCliente ==null || usuarioCliente == null || senhaCliente == null || emailCliente == null){
     String sHTML = "<center>Preencha os campos vazios!<br> <a href = '../index.html'> Voltar </a> </center>";
         out.println(sHTML);
    
    
    }else {

            if (user.VerificarCPF() || user.VerificarEmail() || user.VerificarNumero()) {
                String sHTML = "<center>Estes Dados ja foram cadastrados Anteriomente!<br> <a href = '../index.html'> Voltar </a> </center>";
                out.println(sHTML);
            } else if (user.VerificarUser()) {
                String sHTML = "<center>Estes Usuario ja Existe! Tente outro<br> <a href = '../index.html'> Voltar </a> </center>";
                out.println(sHTML);
            } else {
                user.incluir();
                if (!(user.statusSQL == null)) {
                    out.println(user.statusSQL);

                } else {
                    String sHTML = "<center>Usuário criado com Sucesso!<br> <a href = '../index.html'> Voltar </a> </center>";
                    out.println(sHTML);
                }
            }

        }
 
 
 

 
 session.setAttribute("nomeCliente", user.getNome_cliente());
  session.setAttribute("telefoneCliente", user.getNumero_cliente());
   session.setAttribute("emailCliente", user.getEmail_cliente());
   


%>