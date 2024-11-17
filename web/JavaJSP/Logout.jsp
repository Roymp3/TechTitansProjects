<%@page import="javaBeans.Cliente"%>
<%@page import="javaBeans.Funcionarios"%>
<%

  session.removeAttribute("logadoo");
      session.removeAttribute("nomeClasse");
      session.removeAttribute("clientelog");
      session.removeAttribute("ClienteLogado");
      session.removeAttribute("funcionarioLogado");
    
response.setContentType("text/html;charset=UTF-8");
out.print("<script>");
out.print("alert('Saindo...');");
out.print("setTimeout(function() { window.location.href = '../index.html'; }, 100);"); // 1 segundo de atraso
out.print("</script>");
  
   
    
%>


