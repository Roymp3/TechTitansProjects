<%@page import="javaBeans.Cortes"%>
<% Cortes corte = new Cortes(); // Instancia o objeto Usuario
 if ( !(corte.statusSQL == null) ) out.println(corte.statusSQL);
 
 String nomeCorte = request.getParameter("nomeCorte");
 String valorCortestr = request.getParameter("valorCorte");


 if (nomeCorte != null && !nomeCorte.isEmpty() && valorCortestr != null && !valorCortestr.isEmpty()) {
     String ValorCorreto = valorCortestr.replaceAll(",", ".");
         Double valorCorte = Double.parseDouble(ValorCorreto);
         corte.setNome_corte(nomeCorte);
         corte.setPreco_corte(valorCorte);

         if (corte.VerificarCorte()) {
             String sHTML = "<center>Este corte ja se encontra cadastrado!!<br> <a href = '../CadCorte.html'> Voltar </a> </center>";
             out.println(sHTML);

         } else {
             corte.incluir();

             if (!(corte.statusSQL == null)) {
                 out.println(corte.statusSQL);
             } else {
                 String sHTML = "<center>Corte cadastrado com Sucesso!<br> <a href = '../CadCorte.html'> Voltar </a> </center>";
                 out.println(sHTML);
             }
         }

     } else {
         String sHTML = "<center> Não pode ter campos vazios!<br> <a href = '../CadCorte.html'> Voltar </a> </center>";
         out.println(sHTML);
     }
     



%>