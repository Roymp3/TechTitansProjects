<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="javaBeans.Datas"%>

<% 
    
    Datas dt = new Datas();
    Funcionarios func = new Funcionarios(); // Instancia o objeto Usuario
 if ( !(dt.statusSQL == null) ){
        out.println(dt.statusSQL);
    }    
            String mensageModal = "";
    
            SimpleDateFormat  consulta = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          String data = request.getParameter("dataAgenda") + ":00";
                String FuncLogado = (String) session.getAttribute("funcionarioLogado");

          Date dataConv = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(data);
          String dataa = consulta.format(dataConv);
          
          Timestamp dataConsulta = Timestamp.valueOf(dataa);
          dt.setData_datas(dataConsulta);
          
          func.setUsuario_funcionario(FuncLogado);
          int idFunc=0;
          if(func.buscarIdPorUser()){
                idFunc = func.getId_funcionario();
                dt.setId_funcionario(idFunc);
    
            }   
           
            dt.FinalizarCorteAgendado();
  

        if (!(dt.statusSQL == null)) {
            out.println(dt.statusSQL);
        
        } else {
            mensageModal = "Corte marcado como Finalizado!";
          

        }
    
    
    response.sendRedirect("../perfil.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));


 
%>