<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cortes"%>
<% Cortes corte = new Cortes(); // Instancia o objeto Usuario
 if ( !(corte.statusSQL == null) ) 
        out.println(corte.statusSQL);
      String mensageModal = "";
       String CorteDelete = request.getParameter("corteNome");
       corte.setNome_corte(CorteDelete);

   if(corte.DeletarCorte()){
    
    mensageModal = "Corte Removido com Sucesso!";
     
             
    }
     response.sendRedirect("../consultarCorte.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

%>