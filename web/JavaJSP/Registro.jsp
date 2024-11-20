<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cliente"%>
<% 
    
    
    Cliente user = new Cliente(); // Instancia o objeto Usuario
     String mensageModal ="";
 if ( !(user.statusSQL == null) ) out.println(user.statusSQL);
 
 try{
 
   String nomeCliente = request.getParameter("nomeCliente");
  String cpfCliente = request.getParameter("cpfCliente");
  String numeroCliente = request.getParameter("numeroCliente");
   String usuarioCliente = request.getParameter("userCliente");
   String senhaCliente = request.getParameter("senhaCliente");
    String emailCliente = request.getParameter("emailCliente");
    
    if (cpfCliente != null) cpfCliente = cpfCliente.replaceAll("\\D", ""); // Remove tudo que não for número
    if (numeroCliente != null) numeroCliente = numeroCliente.replaceAll("\\D", ""); // Remove tudo que não for número

 
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
              
            } else if(cpfCliente.length() < 11){
    
             mensageModal= "CPF incorreto";

    
            }else {
                user.incluir();
                if (!(user.statusSQL == null)) {
                    out.println(user.statusSQL);

                } else {
                    mensageModal = "Usuário criado com Sucesso!";
                 
                }
            }

        }

    
    }catch(Exception e){
    
    
        mensageModal = "informe dados validos" + e.getMessage();
    
    }
 

   
    response.sendRedirect("../cadUser.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

   


%>