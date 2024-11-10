<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cliente"%>
<% Cliente user = new Cliente(); // Instancia o objeto Usuario
 if ( !(user.statusSQL == null) ) out.println(user.statusSQL);
 
  String nomeCliente = request.getParameter("nomeCliente");
  String cpfCliente = request.getParameter("cpfCliente");
  String numeroCliente = request.getParameter("numeroCliente");
   String usuarioCliente = request.getParameter("userCliente");
   String senhaCliente = request.getParameter("senhaCliente");
    String emailCliente = request.getParameter("emailCliente");
    
    String mensageModal ="";

 
 // preenche os atributos do objeto usuario

 
 if(nomeCliente ==null || cpfCliente == null || numeroCliente ==null || usuarioCliente == null || senhaCliente == null || emailCliente == null){
     mensageModal = "Preencha os campos vazios!";
        
    
    
    }else {
         user.setNome_cliente(nomeCliente);
         user.setCpf_cliente(cpfCliente);
         user.setNumero_cliente(numeroCliente);
         user.setUsuario_cliente(usuarioCliente);
         user.setSenha_cliente(senhaCliente);
         user.setEmail_cliente(emailCliente);

            if (user.VerificarCPF() || user.VerificarEmail() || user.VerificarNumero()) {
               mensageModal = "Estes Dados ja foram cadastrados Anteriomente!";
             
            } else if (user.VerificarUser()) {
                mensageModal= "Estes Usuario ja Existe! Tente outro";
              
            } else {
                user.incluir();
                if (!(user.statusSQL == null)) {
                    out.println(user.statusSQL);

                } else {
                    mensageModal = "Usuário criado com Sucesso!";
                 
                }
            }

        }

   
    response.sendRedirect("../cadUser.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

   


%>