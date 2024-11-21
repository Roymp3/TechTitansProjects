<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javaBeans.Datas"%>
<%
    Datas dt = new Datas();
    if (!(dt.statusSQL == null)) {
        out.println(dt.statusSQL);
    }
    
    String datal = request.getParameter("dataEscolhida");
  SimpleDateFormat formatoExibir = new SimpleDateFormat("dd/MM/yyyy");
 Date data = new SimpleDateFormat("yyyy-MM-dd").parse(datal);
  String dataExibir = formatoExibir.format(data);


  
%>
<h2 class="dataEscolha">Data do Corte:  <%= dataExibir %><strong></strong></h2>
<label for="cortes" class="alinharLabel">Selecionar corte:</label>
<select id="cortes" name="opcoesCortes">
    <option value="" disabled selected></option>
    <option value="americano">Americano</option>
    <option value="jaca">Corte do Jaca</option>
    <option value="buzzcut">Buzz cut</option>
    <option value="social">Social</option>
</select><br>

<label for="pagamento" class="alinharLabel">Forma de pagamento:</label>
<select id="pagamento" name="opcoesPagamento">
    <option value="" disabled selected></option>
    <option value="credito">Cartão de crédito</option>
    <option value="pix">Pix</option>
    <option value="boleto">Boleto</option>
    <option value="dinheiro">Dinheiro</option>
</select><br>

<label for="barbeiro" class="alinharLabel">Barbeiro disponível:</label>
<select id="barbeiro" name="barbeiroDisponivel">
    <option value="" disabled selected></option>
    <option value="jhonny_gama">Jhonny da Gama</option>
    <option value="roy_jones">Roy Jones</option>
    <option value="bruno_rosa">Bruno Rosa</option>
    <option value="diego_cardoso">Diego Cardoso</option>
</select><br>

<label for="observacao">Observação:</label><br>
<textarea name="observacao" id="observacao" rows="10" cols="35"></textarea>
<div id="contador">0 / 700 caracteres</div>

<button type="submit" class="botoesCad">Agendar corte</button>