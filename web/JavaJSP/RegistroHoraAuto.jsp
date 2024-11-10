<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios" %>
<% 
    Datas dt = new Datas();
    Funcionarios func = new Funcionarios();
     if ( !(dt.statusSQL == null) ) out.println(dt.statusSQL);
     String mensageModal = "";
 String FuncLogado = (String) session.getAttribute("funcionarioLogado");
 func.setUsuario_funcionario(FuncLogado);
  int idFuncData =0;
 if(func.buscarIdPorUser()){
 
  idFuncData = func.getId_funcionario();
 dt.setId_funcionario(idFuncData);
 
 }
 
 dt.InserirDatasAuto();
    
 
if (!(dt.statusSQL == null))
        out.println(dt.statusSQL);
    else {
        mensageModal = "Horarios Gerados com sucesso!";
        
    }
    
    response.sendRedirect("../cadHorario.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

    
%>