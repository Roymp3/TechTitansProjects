<%@page import="javaBeans.Usuario"%>
<%  
    Usuario user = new Usuario(); // Instancia o objeto Usuario 
    if (user.statusSQL == null) {
    String sHtml = "<center> Parabéns, o banco de dados - " + user.MeuBanco;
    sHtml += " - foi criado com sucesso! Confira no MySQL! </center>";
    out.println(sHtml);
    }
    else
    out.println(user.statusSQL);
 %>