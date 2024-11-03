<%@page import="javaBeans.Cortes"%>
<% Cortes corte = new Cortes(); // Instancia o objeto Usuario
 if ( !(corte.statusSQL == null) ) 
        out.println(corte.statusSQL);
        
       String CorteDelete = request.getParameter("corteNome");
       corte.setNome_corte(CorteDelete);

   if(corte.DeletarCorte()){
    
     String sHTML = "<script>alert('Corte Removido com Sucesso!'); window.location.href = '../consultarCorte.html';</script>";
     out.println(sHTML);
             
    }
 
%>