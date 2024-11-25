<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Instanciar os objetos necessários
    Datas dt = new Datas();
    List<Datas> listaData = dt.DatasDisponiveisFunc();
    Funcionarios func = new Funcionarios();
%>

<%
    // Usar um Set para evitar duplicação de funcionários
    java.util.Set<Integer> idsExibidos = new java.util.HashSet<>();

    for (Datas data : listaData) {
        int funcId = data.getId_funcionario();

        if (!idsExibidos.contains(funcId)) {
            idsExibidos.add(funcId);

            // Buscar o nome do funcionário
            func.setId_funcionario(funcId);
            func.BuscarNomeID();
%>
<div class="box-cad">
    <div class="frmCadUser">
        <form method="get" action="JavaJSP/DeletarHorario.jsp">
            <label for="clientName" class="labelCadUsuario">Nome do Funcionário:</label>
            <input class="inpCadUser" type="text" id="clientName" name="nomeFunc" value="<%= func.getNome_funcionario()%>" readonly>
             <button class="check-button">&times;</button>
            <label for="hora_<%= funcId%>" class="labelCadUsuario">Data e Hora:</label>
            <select name="hora1" id="hora_<%= funcId%>">
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
                    for (Datas dataFuncionario : listaData) {
                        if (dataFuncionario.getId_funcionario() == funcId) {
                            String dataFormatada = sdf.format(dataFuncionario.getData_datas());
                %>
                <option value="<%= dataFuncionario.getData_datas()%>">
                    <%= dataFormatada%>
                </option>
                <%
                        }
                    }
                %>
            </select>
         
        </form>
    </div>
</div>
<%
        }
    }
%>