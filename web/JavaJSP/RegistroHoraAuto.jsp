<%@page import="java.util.Date"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios" %>
<% 
    Datas dt = new Datas();
    Funcionarios func = new Funcionarios();
     if ( !(dt.statusSQL == null) ) out.println(dt.statusSQL);
     
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
        String sHTML = "<center>Horarios Gerados com sucesso!<br> <a href = '../index.html'> Voltar </a> </center>";
        out.println(sHTML);
    }
    
%>