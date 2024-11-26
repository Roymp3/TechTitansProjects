<%@page import="javaBeans.Cortes"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Cliente"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Status"%>

<%
    Datas dt = new Datas();
    Cliente cli = new Cliente();
    Funcionarios func = new Funcionarios();
    Cortes ct = new Cortes();
    Status sta = new Status();
  
    
    SimpleDateFormat formatoDataExibir = new SimpleDateFormat("dd/MM/yyyy");
    String UsuarioLogado = (String) session.getAttribute("ClienteLogado");
    String FuncLogado = (String) session.getAttribute("funcionarioLogado");

    List<Datas> listaAgendacli = new ArrayList<>();
    String titulo = "";
    
    cli.setUsuario_cliente(UsuarioLogado);
    func.setUsuario_funcionario(FuncLogado);
    
    if (cli.buscarClientePorUser()) {
        titulo = "Barbeiro Selecionado:";
        if (cli.buscarIDPorUser()) {
            int idcli = cli.getId_cliente();
            dt.setId_cliente(idcli);
        }
        listaAgendacli = dt.buscarFinalizadosCliente();
    } else if (func.buscarFuncPorUser()) {
        titulo = "Cliente:";
        if (func.buscarIdPorUser()) {
            int idfunc = func.getId_funcionario();
            dt.setId_funcionario(idfunc);
        }
        listaAgendacli = dt.buscarFinalizadosFunc();
    }
%>

<h2>Cortes Finalizados</h2>
  <div class="agenda-container">
<% 
    if (listaAgendacli.isEmpty()) { 
%>
    <p>Você não tem cortes Finalizados no momento.</p>
<% 
    } else {
        for (Datas dataa : listaAgendacli) {
            Timestamp dataCli = dataa.getData_datas();
            String exibirdataCli = formatoDataExibir.format(dataCli);
            String horarioCli = new SimpleDateFormat("HH:mm").format(dataCli);

            int idfunc = dataa.getId_funcionario();
            func.setId_funcionario(idfunc);

            int idcoorte = dataa.getId_corte();
            ct.setId_corte(idcoorte);

            int idstatus = dataa.getId_status();
            sta.setId_status(idstatus);

            int idcliente = dataa.getId_cliente();
            cli.setId_cliente(idcliente);

            func.BuscarNomeID();
            ct.buscarNomePorId();
            sta.BuscarNomeID();
            cli.buscarNomePorID();

            String nome = "";
            if (titulo.equals("Barbeiro Selecionado:")) {
                nome = func.getNome_funcionario();
            } else if (titulo.equals("Cliente:")) {
                nome = cli.getNome_cliente();
            }
    %>

    <div class="appointment">
        <img src="img/imagem 1 - teste.jpg" alt="Foto do Barbeiro">
        <div class="appointment-info" id="agenda-perfil">
            <p>Data e Hora: <strong><%= exibirdataCli %> <%= horarioCli %></strong></p>
            <p><%= titulo %> <strong><%= nome %></strong></p>
            <p>Corte Escolhido: <strong><%= ct.getNome_corte() %></strong></p>
            <p>Forma de Pagamento: <strong><%= dataa.getTipo_pagamento() %></strong></p>
            <p>Status: <strong><%= sta.getNome_status() %></strong></p>
        </div>
    </div>
  

<% 
        }
    }
%>
 </div>  