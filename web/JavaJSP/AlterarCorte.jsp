<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Cortes"%>
<% 
    Cortes corte = new Cortes(); // Instancia o objeto Usuario
 if ( !(corte.statusSQL == null) ) 
        out.println(corte.statusSQL);
        
          String corteORginal = (String) session.getAttribute("nomeCorte");
          
            String mensageModal = "";
       
       String novoNome = request.getParameter("nomeCorteAlterar");
           String novoPreco = request.getParameter("valorCorteAlterar");

        
       
if (novoNome == null || novoPreco == null ) {

       mensageModal = "Preencha os campos vazios!";
        

    } else {
            String precoNovoFinal = novoPreco.replaceAll(".",".");
    
        Double precoNovo = Double.parseDouble(precoNovoFinal);
         corte.setPreco_corte(precoNovo);
         corte.setNome_corte(novoNome);

        corte.AlterarCorte(corteORginal);

        if (!(corte.statusSQL == null)) {
            out.println(corte.statusSQL);
        } else {
            mensageModal = "Corte Alterado com Sucesso!";
            

        }
    }

    response.sendRedirect("../AlterarCorte.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

 
%>