<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="javaBeans.Cortes"%>
<%@page import="javaBeans.Cliente"%>


<% 
    
    Datas dt = new Datas();
    Cliente cl = new Cliente();
    Funcionarios func = new Funcionarios();
    Cortes ct = new Cortes();
    
// Instancia o objeto Usuario
     String mensageModal ="";
 if ( !(dt.statusSQL == null) ) out.println(dt.statusSQL);
 
 try{
 
   
    
    }catch(Exception e){
    
    
        mensageModal = "informe dados validos" + e.getMessage();
    
    }
 

   
    response.sendRedirect("../cadUser.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

   


%>