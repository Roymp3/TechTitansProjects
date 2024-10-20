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
           
func.setNome_funcionario(nomeFunc);
func.setCargo_funcionario(cargoFunc);
func.setCpf_funcionario(cpfFunc);
func.setRg_funcionario(rgFunc);
func.setUsuario_funcionario(userFunc);
func.setSenha_funcionario(senhaFunc);

if (nomeFunc == null || cargoFunc == null || cpfFunc == null || rgFunc == null || salFuncstr == null || userFunc == null || senhaFunc == null) {

        String sHTML = "<center>Preencha os campos vazios!<br> <a href = '../index.html'> Voltar </a> </center>";
        out.println(sHTML);

    }else {
          Double salFunc = Double.parseDouble(salFuncstr);
          func.setSalario_funcionario(salFunc);

            if (func.VerificarRG() || func.VerificarCPF()) {

                String sHTML = "<center>Estes Dados ja foram cadastrado anteriomente.<br> <a href = '../index.html'> Voltar </a> </center>";
                out.println(sHTML);

            } else if (func.VerificarUser()) {
                String sHTML = "<center>Este Usuario ja existe, tente outro.<br> <a href = '../index.html'> Voltar </a> </center>";
                out.println(sHTML);

            } else {
                func.incluir();

                if (!(func.statusSQL == null)) {
                    out.println(func.statusSQL);
                } else {
                    String sHTML = "<center>Funcionario criado com Sucesso!<br> <a href = '../index.html'> Voltar </a> </center>";
                    out.println(sHTML);

                }
            }

        }


      
    

%>