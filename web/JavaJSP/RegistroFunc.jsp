<%@page import="java.net.URLEncoder"%>
<%@page import="javaBeans.Funcionarios"%>
<% Funcionarios func = new Funcionarios();
 if ( !(func.statusSQL == null) ) out.println(func.statusSQL);
 
  String nomeFunc = request.getParameter("txtNome");
  String cargoFunc = request.getParameter("txtCargo");
  String cpfFunc = request.getParameter("txtCpf");
   String rgFunc = request.getParameter("txtRg");
   String salFuncstr = request.getParameter("txtSalario");
   String userFunc = request.getParameter("txtUserFunc");
   String senhaFunc = request.getParameter("txtSenhaFunc") ;
   
    String mensageModal = "";
           

if (nomeFunc == null || cargoFunc == null || cpfFunc == null || rgFunc == null || salFuncstr == null || userFunc == null || senhaFunc == null) {

        mensageModal = "Preencha os campos vazios!";
       

    }else {
     func.setNome_funcionario(nomeFunc);
        func.setCargo_funcionario(cargoFunc);
        func.setCpf_funcionario(cpfFunc);
        func.setRg_funcionario(rgFunc);
        func.setUsuario_funcionario(userFunc);
        func.setSenha_funcionario(senhaFunc);
          Double salFunc = Double.parseDouble(salFuncstr);
          func.setSalario_funcionario(salFunc);

            if (func.VerificarRG() || func.VerificarCPF()) {

                mensageModal = "Estes Dados ja foram cadastrado anteriomente!";
              

            } else if (func.VerificarUser()) {
                mensageModal = "Este Usuario ja existe, tente outro!";
                

            } else {
                func.incluir();

                if (!(func.statusSQL == null)) {
                    out.println(func.statusSQL);
                } else {
                    mensageModal = "Funcionario criado com Sucesso";
                   

                }
            }

        }
        
            response.sendRedirect("../cadFuncionario.html?mensagem=" + URLEncoder.encode(mensageModal, "UTF-8"));


      
    

%>