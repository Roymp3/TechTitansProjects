<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page  import="java.sql.Timestamp" %>

<% 
    
    Datas dt = new Datas(); // Instancia o objeto Usuario
    Funcionarios func = new Funcionarios();
 if ( !(dt.statusSQL == null) ) out.println(dt.statusSQL);
 
 String dataMarcada =   request.getParameter("dataHora");
 SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
 java.util.Date datautil = formato.parse(dataMarcada);
 
 
Timestamp DataConv = new Timestamp(datautil.getTime());
 dt.setData_datas(DataConv);
 
String FuncLogado = (String) session.getAttribute("funcionarioLogado");
 func.setUsuario_funcionario(FuncLogado);
  int idFuncData =0;
 if(func.buscarIdPorUser()){
 
  idFuncData = func.getId_funcionario();
 dt.setId_funcionario(idFuncData);
 
 }
 if(dt.VerificarData()){
    
    String sHTML = "<center>Este horario ja foi cadastrado anteriomente! tente outro!<br> <a href = '../index.html'> Voltar </a> </center>";
        out.println(sHTML);
    
   }else{
   
    dt.incluir();
    if (!(dt.statusSQL == null)){
    out.println(dt.statusSQL);
    }      
    else {
        String sHTML = "<center>Horario salvo  com Sucesso!<br> <a href = '../index.html'> Voltar </a> </center>";
        out.println(sHTML);
   }
    
  }



%>