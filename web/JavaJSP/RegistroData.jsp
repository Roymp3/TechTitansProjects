<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page  import="java.sql.Timestamp" %>
 <%@page import="java.util.Date"%>

<% 
    
    Datas dt = new Datas(); // Instancia o objeto Usuario
    Funcionarios func = new Funcionarios();
 if ( !(dt.statusSQL == null) ) out.println(dt.statusSQL);
 
 String dataMarcada =   request.getParameter("dataHora");
 SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
 java.util.Date datautil = formato.parse(dataMarcada);
 
 String mensageModal= "";
 
 Date dataAtual = new Date();
 
 if (datautil.before(dataAtual)) {
         mensageModal = "Data inválida! A data marcada não pode ser anterior à data de hoje.";
         
     } else {

         Timestamp DataConv = new Timestamp(datautil.getTime());
         dt.setData_datas(DataConv);

         String FuncLogado = (String) session.getAttribute("funcionarioLogado");
         func.setUsuario_funcionario(FuncLogado);
         int idFuncData = 0;
         if (func.buscarIdPorUser()) {

             idFuncData = func.getId_funcionario();
             dt.setId_funcionario(idFuncData);

         }
         if (dt.VerificarData()) {

             mensageModal = "Este horario ja foi cadastrado anteriomente! tente outro!";
             

         } else {

             dt.incluir();
             if (!(dt.statusSQL == null)) {
                 out.println(dt.statusSQL);
             } else {
                 mensageModal = "Horario salvo  com Sucesso!";
               
             }

         }

     }
 
    response.sendRedirect("../cadHorario.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));





%>