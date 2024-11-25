<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cliente"%>
<%@page import="javaBeans.Funcionarios"%>
<%
    String mensageModal = "";
  session.removeAttribute("logadoo");
      session.removeAttribute("nomeClasse");
      session.removeAttribute("clientelog");
      session.removeAttribute("ClienteLogado");
      session.removeAttribute("funcionarioLogado");
    
response.setContentType("text/html;charset=UTF-8");
mensageModal ="sessão finalizada!";
  
       response.sendRedirect("../index.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

    
%>


