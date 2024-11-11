<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cliente"%>
<% 
    Cliente cli = new Cliente(); // Instancia o objeto Usuario
 if ( !(cli.statusSQL == null) ) 
        out.println(cli.statusSQL);
       String mensageModal = "";
       String clienteDelete = request.getParameter("CpfCliente");
       cli.setCpf_cliente(clienteDelete);

   if(cli.DeletarCliente()){
    
     mensageModal = "Cliente Removido com Sucesso!";
     
             
    }
    
      response.sendRedirect("../consultarCliente.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

 
%>