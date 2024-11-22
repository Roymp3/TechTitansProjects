<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="javaBeans.Cortes"%>


<%
    Cortes ct = new Cortes();
    Funcionarios func = new Funcionarios();
    Datas dt = new Datas();
    if (!(dt.statusSQL == null)) {
        out.println(dt.statusSQL);
    }
    
    String datal = URLDecoder.decode(request.getParameter("dataEscolhida"), "UTF-8");
    String hora = URLDecoder.decode(request.getParameter("hora1"), "UTF-8");

    SimpleDateFormat formatoExibir = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat horaExibir = new SimpleDateFormat("HH:mm");
    SimpleDateFormat consulta = new SimpleDateFormat("yyyy-MM-dd");

    Date data = new SimpleDateFormat("yyyy-MM-dd").parse(datal);
    Date horaConv = new SimpleDateFormat("HH:mm").parse(hora);
    
    String dataCompleta = consulta.format(data) + " " + horaExibir.format(horaConv);
    String dataFinal = dataCompleta + ":00";
    
    Timestamp dataConsulta = Timestamp.valueOf(dataFinal);  
    
    dt.setData_datas(dataConsulta);
    session.setAttribute("dataCliente", dataConsulta);
    
    Timestamp dataa = (Timestamp) session.getAttribute("dataCliente");
    out.print(dataa);
    
    String dataExibir = formatoExibir.format(data);
    String mostraHora = horaExibir.format(horaConv);

    List<Datas> listdt = dt.BuscatIdFuncData();
    List<Cortes> listcorte = ct.buscarCortes();
%>

<h2 class="dataEscolha">Data do Corte: <%= dataExibir %> <%= mostraHora %> </h2>

<form action="JavaJSP/AgendarCorte.jsp" method="post">
    <label for="cortes" class="alinharLabel">Selecionar corte:</label>
    <select id="cortes" name="opcoesCortes">
        <%
            for(Cortes cortee: listcorte){
        %>
        <option value="<%= cortee.getNome_corte() %>"><%= cortee.getNome_corte() %></option>  
        <%
            }
        %>
    </select><br>

    <label for="pagamento" class="alinharLabel">Forma de pagamento:</label>
    <select id="pagamento" name="opcoesPagamento">
        <option value="Cartao">Cartão</option>
        <option value="Pix">Pix</option>
        <option value="Dinheiro">Dinheiro</option>
    </select><br>

    <label for="barbeiro" class="alinharLabel">Barbeiro disponível:</label>
    <select id="barbeiro" name="barbeiroDisponivel">
        <%
            String nome ="n encontrei";
            for(Datas barbeiro: listdt){
                int idFunc = barbeiro.getId_funcionario();
                func.setId_funcionario(idFunc);
                if(func.BuscarNomeID()){
                    nome = func.getNome_funcionario();
                }
        %>
        <option value="<%= nome %>"><%= nome %></option>
        <%
            }
        %>
    </select><br>

    <label for="observacao">Observação:</label><br>
    <textarea name="observacao" id="observacao" rows="10" cols="35"></textarea>
    <div id="contador">0 / 700 caracteres</div>

    <button type="submit" class="botoesCad">Agendar corte</button>
</form>
