<%@page import="java.sql.Timestamp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="javaBeans.Cortes"%>
<%@page import="javaBeans.Cliente"%>


<% 
    
    Datas dt = new Datas();
    Cliente cl = new Cliente();
    Funcionarios func = new Funcionarios();
    Cortes ct = new Cortes();
    
 
    
     String mensageModal ="";
 if ( !(dt.statusSQL == null) ) out.println(dt.statusSQL);
 
 try{
 
      
        String opcCorte = request.getParameter("opcoesCortes");
        String opcPagamento = request.getParameter("opcoesPagamento");
        String opcBarbeiro = request.getParameter("barbeiroDisponivel");
        String opcObs = request.getParameter("observacao");
        func.setNome_funcionario(opcBarbeiro);
        int idfunc =0;
        if(func.buscarIdPorNome()){
            idfunc = func.getId_funcionario();
         
        }
        
        dt.setId_status(1);
        
        dt.setObservacao(opcObs);
        dt.setTipo_pagamento(opcPagamento);
        
        Timestamp dataClientee = (Timestamp) session.getAttribute("dataCliente");
        out.println("Data do Cliente: " + dataClientee);
        out.println("ID Funcionário: " + idfunc);
        out.println("Observação: " + opcObs);
        out.println("ID Corte: " + ct.getNome_corte());
        
   
         String UsuarioLogado = (String) session.getAttribute("ClienteLogado");
         
         cl.setUsuario_cliente(UsuarioLogado);
         
         int idcli=0;
         if(cl.buscarIDPorUser()){
            idcli = cl.getId_cliente();
            dt.setId_cliente(idcli);
        }


    
         ct.setNome_corte(opcCorte);
        int idcorte =0;
        if(ct.buscarIdPorNome()){
            idcorte = ct.getId_corte();
            dt.setId_corte(idcorte);
            
          }
          
          dt.AgendarCorte(dataClientee,idfunc);
           if (!(dt.statusSQL == null)) {
           

        } else {
            mensageModal = "Corte agendado com sucesso!";
            

        }
          
    } catch (NumberFormatException e) {
            mensageModal = "Erro na conversão de números: " + e.getMessage();
        } catch (NullPointerException e) {
            mensageModal = "Dados não encontrados: " + e.getMessage();
        } catch (Exception e) {
            mensageModal = "Erro inesperado: " + e.getMessage();
        }

   
   
    response.sendRedirect("../Pagamento.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));

   


%>