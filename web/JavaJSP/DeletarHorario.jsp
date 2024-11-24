<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="java.sql.Timestamp" %>



<% 
    Datas dt = new Datas();
    Funcionarios func = new  Funcionarios();
 if ( !(dt.statusSQL == null) ) 
        out.println(dt.statusSQL);
        
        SimpleDateFormat consulta = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
       String mensageModal = "";
       String funcDelete = request.getParameter("nomeFunc");
        func.setNome_funcionario(funcDelete);
       int idFunc = 0;
      if(func.buscarIdPorNome()){
    
        idFunc = func.getId_funcionario();
        dt.setId_funcionario(idFunc );
      
      }

       String horaDelete = request.getParameter("hora1");
       
        Date data =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(horaDelete);
        String dataFinal = consulta.format(data);
        Timestamp dataConsulta = Timestamp.valueOf(dataFinal);
        
        dt.setData_datas(dataConsulta);
        
   if(dt.DeletarHorario()){
    
     mensageModal = "Horario Removido com Sucesso!";
     
             
    }
    
    response.sendRedirect("../ConsultarHorario.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

 
%>