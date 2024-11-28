<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Funcionarios"%>
<% 
    Funcionarios func = new Funcionarios(); // Instancia o objeto Usuario
           String mensageModal = "";

 if ( !(func.statusSQL == null) ) {
        out.println(func.statusSQL);        
    }
       String funcDelete = request.getParameter("funcionarioCPF");
       func.setCpf_funcionario(funcDelete);

   if(func.DeletarFunc()){
    
     mensageModal = "Funcionario Removido com Sucesso!";
     
             
    }
    
    response.sendRedirect("../consultarFuncionario.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

 
%>