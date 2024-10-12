<%@page import="javaBeans.Funcionarios"%>
<% Funcionarios func = new Funcionarios();
 if ( !(func.statusSQL == null) ) out.println(func.statusSQL);
 
  String nomeFunc = request.getParameter("txtNome");
  String cargoFunc = request.getParameter("txtCargo");
  String cpfFunc = request.getParameter("txtCpf");
   String rgFunc = request.getParameter("txtRg");
   Double salFunc = Double.parseDouble(request.getParameter("txtSalario"));
   String userFunc = request.getParameter("txtUserFunc");
   String senhaFunc = request.getParameter("txtSenhaFunc") ;
           
func.setNome_funcionario(nomeFunc);
func.setCargo_funcionario(cargoFunc);
func.setCpf_funcionario(cpfFunc);
func.setRg_funcionario(rgFunc);
func.setSalario_funcionario(salFunc);
func.setUsuario_funcionario(userFunc);
func.setSenha_funcionario(senhaFunc);

 func.incluir();
 // chama o método para fazer a inclusão no banco de dados
 
 
if (!(func.statusSQL == null))
        out.println(func.statusSQL);
    else {
        String sHTML = "<center>Funcionario criado com Sucesso!<br> <a href = '../index.html'> Voltar </a> </center>";
        out.println(sHTML);
    }
%>