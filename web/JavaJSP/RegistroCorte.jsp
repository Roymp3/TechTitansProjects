<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cortes"%>
<% Cortes corte = new Cortes(); // Instancia o objeto Usuario
 if ( !(corte.statusSQL == null) ) out.println(corte.statusSQL);
 
 String nomeCorte = request.getParameter("nomeCorte");
 String valorCortestr = request.getParameter("valorCorte");
 
 String mensageModal = "";


 if (nomeCorte != null && !nomeCorte.isEmpty() && valorCortestr != null && !valorCortestr.isEmpty()) {
     String ValorCorreto = valorCortestr.replaceAll(",", ".");
         Double valorCorte = Double.parseDouble(ValorCorreto);
         corte.setNome_corte(nomeCorte);
         corte.setPreco_corte(valorCorte);

         if (corte.VerificarCorte()) {
             mensageModal = "Este corte ja se encontra cadastrado";
            

         } else {
             corte.incluir();

             if (!(corte.statusSQL == null)) {
                 out.println(corte.statusSQL);
             } else {
                 mensageModal = "Corte cadastrado com Sucesso";
                 
             }
         }

     } else {
        mensageModal = " Não pode ter campos vazios!";
       
     }
     
    response.sendRedirect("../CadCorte.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));



%>