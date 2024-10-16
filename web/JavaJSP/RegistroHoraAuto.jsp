<%@page import="java.util.Date"%>
<%@page import="javaBeans.Datas"%>
<% 
    Datas data = new Datas();
     if ( !(data.statusSQL == null) ) out.println(data.statusSQL);
     
    data.InserirDatasAuto();
    
 
if (!(data.statusSQL == null))
        out.println(data.statusSQL);
    else {
        String sHTML = "<center>Horarios Gerados com sucesso!<br> <a href = '../index.html'> Voltar </a> </center>";
        out.println(sHTML);
    }
    
%>