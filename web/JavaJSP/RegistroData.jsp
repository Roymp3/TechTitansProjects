<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javaBeans.Datas"%>
<%@page import="javaBeans.Funcionarios"%>
<%@page import="java.sql.Timestamp" %>
<%@page import="java.util.Date"%>

<% 
    Datas dt = new Datas(); 
    Funcionarios func = new Funcionarios();
    String mensageModal = ""; 


    if (dt.statusSQL != null) {
        out.println(dt.statusSQL);
    }


    String dataMarcada = request.getParameter("dataHora");

    if (dataMarcada == null || dataMarcada.trim().isEmpty()) {
        mensageModal = "Data inválida! Por favor, insira uma data válida.";
    } else {
        try {
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            java.util.Date datautil = formato.parse(dataMarcada);
            Date dataAtual = new Date();

            if (datautil.before(dataAtual)) {
                mensageModal = "Data inválida! A data marcada não pode ser anterior à data de hoje.";
            } else {
                
                Timestamp DataConv = new Timestamp(datautil.getTime());
                dt.setData_datas(DataConv);

                
                String FuncLogado = (String) session.getAttribute("funcionarioLogado");
                func.setUsuario_funcionario(FuncLogado);

                int idFuncData = 0;
        
                if (func.buscarIdPorUser()) {
                    idFuncData = func.getId_funcionario();
                    dt.setId_funcionario(idFuncData);
                }

              
                
                if (dt.VerificarData()) {
                    mensageModal = "Este horário já foi cadastrado anteriormente! Tente outro.";
                } else {
                    
                    dt.incluir();
                    if (dt.statusSQL != null) {
                        out.println(dt.statusSQL);
                    } else {
                        mensageModal = "Horário salvo com sucesso!";
                    }
                }
            }
        } catch (java.text.ParseException e) {
            mensageModal = "Erro ao processar a data: " + e.getMessage();
        }
    }

   
    response.sendRedirect("../cadHorario.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));
%>
