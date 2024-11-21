<%@page import="java.util.Collections"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="javaBeans.Datas"%>
<%@page import="java.util.List" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
   Datas dt = new Datas();
   List<Datas> listaData = dt.DatasDisponiveis();
   Collections.sort(listaData, new java.util.Comparator<Datas>() {
       public int compare(Datas data1, Datas data2) {
           return data1.getData_datas().compareTo(data2.getData_datas());
       }
   });
   Set<String> datasExibidas = new HashSet<>();
%>

<%
   try {
        SimpleDateFormat formatoData = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formatoDataExibir = new SimpleDateFormat("dd/MM/yyyy");

        for (Datas data : listaData) {
           Timestamp dataDisp = data.getData_datas();
           String dataAgenda = formatoData.format(dataDisp);
           String exibirData = formatoDataExibir.format(dataDisp);

           if (!datasExibidas.contains(dataAgenda)) {
               datasExibidas.add(dataAgenda);
%>
    <div class="box-cad">
        <form class="frmCadUser" action="./Pagamento.html" method="get" >
            <label for="data1" class="labelCadUsuario">Data:</label>
            <input type="text" id="dataDisp" class="inpCadUser" value="<%= exibirData %>" readonly>
            
            <!-- Passando a data escolhida na URL com o parâmetro dataEscolhida -->
            <input type="hidden" name="dataEscolhida" value="<%= dataAgenda %>">
            
            <label for="hora1" class="labelCadUsuario">Horário disponíveis:</label>
            <select name="hora1" id="hora1" required>
<%
               for (Datas dataa : listaData) {
                   Timestamp dataDispInterna = dataa.getData_datas();
                   String dataAgendaInterna = formatoData.format(dataDispInterna);
                   String horarioAgenda = new SimpleDateFormat("HH:mm").format(dataDispInterna);

                   if(dataAgendaInterna.equals(dataAgenda)){
%>
                    <option value="<%= horarioAgenda %>"><%= horarioAgenda %></option>
<%
                 }
               }
%>
            </select>
            <button type="submit" class="botaoCadUser">Agendar</button>
        </form> 
      
    </div>
<%
           }
       }
   } catch (Exception err) {
       out.print("Ocorreu um erro inesperado, contate o suporte: " + err.getMessage());
   }
%>
