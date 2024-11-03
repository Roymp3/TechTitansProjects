<%@page import="javaBeans.Cortes"%>
<% 
    Cortes corte = new Cortes(); // Instancia o objeto Usuario
 if ( !(corte.statusSQL == null) ) 
        out.println(corte.statusSQL);
        
          String corteORginal = (String) session.getAttribute("nomeCorte");
       
       String novoNome = request.getParameter("nomeCorteAlterar");
           String novoPreco = request.getParameter("valorCorteAlterar");

        
       
if (novoNome == null || novoPreco == null ) {

        String sHTML = "<center>Preencha os campos vazios!<br> <a href = '../index.html'> Voltar </a> </center>";
        out.println(sHTML);

    } else {
        Double precoNovo = Double.parseDouble(novoPreco);
         corte.setPreco_corte(precoNovo);
         corte.setNome_corte(novoNome);

        corte.AlterarCorte(corteORginal);

        if (!(corte.statusSQL == null)) {
            out.println(corte.statusSQL);
        } else {
            String sHTML = "<script>alert('Corte Alterado com Sucesso!'); window.location.href = '../consultarCorte.html';</script>";
            out.println(sHTML);

        }
    }

 
%>