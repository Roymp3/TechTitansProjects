<%@page import="javaBeans.Funcionarios"%>
<% 
    Funcionarios func = new Funcionarios(); // Instancia o objeto Usuario
 if ( !(func.statusSQL == null) ) 
        out.println(func.statusSQL);
        
       String funcDelete = request.getParameter("funcionarioCPF");
       func.setCpf_funcionario(funcDelete);

   if(func.DeletarFunc()){
    
     String sHTML = "<script>alert('Funcionario Removido com Sucesso!'); window.location.href = '../consultarFuncionario.html';</script>";
     out.println(sHTML);
             
    }
 
%>