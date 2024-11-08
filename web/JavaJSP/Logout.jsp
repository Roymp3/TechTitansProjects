<%@page import="javaBeans.Cliente"%>
<%@page import="javaBeans.Funcionarios"%>
<%

    session.removeAttribute("ClienteLogado");
     session.removeAttribute("funcionarioLogado");
     session.removeAttribute("clientelog");
     session.removeAttribute("nomeClasse");
     
        String sHTML = "<script>alert('Saindo..'); window.location.href = '../index.html';</script>";
     out.println(sHTML);
    
%>


