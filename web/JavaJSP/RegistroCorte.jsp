<%@page import="javaBeans.Cortes"%>
<% Cortes corte = new Cortes(); // Instancia o objeto Usuario
 if ( !(corte.statusSQL == null) ) out.println(corte.statusSQL);
 
 String nomeCorte = request.getParameter("nomeCorte");
 String valorCortestr = request.getParameter("valorCorte");
 String ValorCorreto = valorCortestr.replaceAll(",", ".");

 if(nomeCorte != null && !nomeCorte.isEmpty() && valorCortestr !=null && !valorCortestr.isEmpty()){
        Double valorCorte = Double.parseDouble(ValorCorreto);
        corte.setNome_corte(nomeCorte);
        corte.setPreco_corte(valorCorte);
        corte.incluir();

        if (!(corte.statusSQL == null))
            out.println(corte.statusSQL);
        else {
            String sHTML = "<center>Corte cadastrado com Sucesso!<br> <a href = '../index.html'> Voltar </a> </center>";
            out.println(sHTML);
        }    
}else{
      String sHTML = "<center>Nome ou preço não podem estar vazios!<br> <a href = '../CadCorte.html'> Voltar </a> </center>";
            out.println(sHTML);
    }


%>