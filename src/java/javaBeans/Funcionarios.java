package javaBeans;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Funcionarios extends Conectar{
    private int id_funcionario;
    private String nome_funcionario;
    private  String cargo_funcionario;
    private Double salario_funcionario;
    private String usuario_funcionario;
    private String senha_funcionario;
    private String cpf_funcionario;
    private String rg_funcionario;

    public int getId_funcionario() {
        return id_funcionario;
    }

    public void setId_funcionario(int id_funcionario) {
        this.id_funcionario = id_funcionario;
    }

    public String getNome_funcionario() {
        return nome_funcionario;
    }

    public void setNome_funcionario(String nome_funcionario) {
        this.nome_funcionario = nome_funcionario;
    }

    public String getCargo_funcionario() {
        return cargo_funcionario;
    }

    public void setCargo_funcionario(String cargo_funcionario) {
        this.cargo_funcionario = cargo_funcionario;
    }

    public String getUsuario_funcionario() {
        return usuario_funcionario;
    }

    public void setUsuario_funcionario(String usuario_funcionario) {
        this.usuario_funcionario = usuario_funcionario;
    }

    public String getSenha_funcionario() {
        return senha_funcionario;
    }

    public void setSenha_funcionario(String senha_funcionario) {
        this.senha_funcionario = senha_funcionario;
    }

    public String getCpf_funcionario() {
        return cpf_funcionario;
    }

    public void setCpf_funcionario(String cpf_funcionario) {
        this.cpf_funcionario = cpf_funcionario;
    }

    public String getRg_funcionario() {
        return rg_funcionario;
    }

    public void setRg_funcionario(String rg_funcionario) {
        this.rg_funcionario = rg_funcionario;
    }
    
 
     public Double getSalario_funcionario() {
        return salario_funcionario;
    }

    public void setSalario_funcionario(Double salario_funcionario) {
        this.salario_funcionario = salario_funcionario;
    }

    
    
     public void incluir() {
        try {
            sql = "insert into tbl_funcionarios(nome_funcionario, cargo_funcionario, usuario_funcionario, password_funcionario, cpf_funcionario, rg_funcionario, salario_funcionario ) "
                    + "values (?,?,?,?,?,?,?);";
            ps = con.prepareStatement(sql); // prepara SQL
            ps.setString(1, nome_funcionario); // Configura Parametros
            ps.setString(2, cargo_funcionario); // Configura Parametros
            ps.setString(3, usuario_funcionario); // Configura Parametros
            ps.setString(4, senha_funcionario); // Configura Parametros
            ps.setString(5, cpf_funcionario);
            ps.setString(6,rg_funcionario);
            ps.setDouble(7,salario_funcionario);// Configura Parametros
            ps.executeUpdate(); 
      
            this.statusSQL = null; // armazena null se deu tudo certo
            
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao incluir Funcionario ! <br> " + ex.getMessage();
        }
    }
     
      public List<Funcionarios> buscarFuncionarios() {
          List<Funcionarios> listaFunc = new ArrayList<>();
          
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "SELECT nome_funcionario, cpf_funcionario, rg_funcionario, cargo_funcionario, salario_funcionario  from tbl_funcionarios";
            ps = con.prepareStatement(sql); 
           tab = ps.executeQuery(); 

          
            while (tab.next()) {
               Funcionarios func = new Funcionarios();
               func.setNome_funcionario(tab.getString("nome_funcionario"));
                func.setCpf_funcionario(tab.getString("cpf_funcionario"));
                 func.setRg_funcionario(tab.getString("rg_funcionario"));
                  func.setCargo_funcionario(tab.getString("cargo_funcionario"));
                  func.setSalario_funcionario(tab.getDouble("salario_funcionario"));
                
               listaFunc.add(func);
               
                this.statusSQL = null;  // Limpa status em caso de sucesso
  
            } 

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar cliente! <br> " + ex.getMessage();
             ex.printStackTrace();
            
        }
        return listaFunc;
     }
      
         public boolean buscarFuncPorCpf() {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "SELECT nome_funcionario, cpf_funcionario, rg_funcionario, cargo_funcionario, salario_funcionario,usuario_funcionario,password_funcionario  FROM tbl_funcionarios WHERE cpf_funcionario= ?";
            ps = con.prepareStatement(sql); 
            ps.setString(1, cpf_funcionario); 
           tab = ps.executeQuery(); 

          
            if (tab.next()) {
               nome_funcionario = tab.getString("nome_funcionario");
               cpf_funcionario= tab.getString("cpf_funcionario");
                rg_funcionario  = tab.getString("rg_funcionario");
                cargo_funcionario = tab.getString("cargo_funcionario");
                salario_funcionario = tab.getDouble("salario_funcionario");
                usuario_funcionario = tab.getString("usuario_funcionario");
                senha_funcionario = tab.getString("password_funcionario");
      
                this.statusSQL = null;  // Limpa status em caso de sucesso
             return true;
            } else {
                this.statusSQL = "Funcionario não encontrado!";
              
            }

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar Funcionario! <br> " + ex.getMessage();
            
        } 
        
        return false;
    } 
     
       public boolean getLogin() {
        if (usuario_funcionario == null || senha_funcionario == null || usuario_funcionario.isEmpty() || senha_funcionario.isEmpty()) {
                this.statusSQL = "Usuario ou senha não podem ser vazios";
                  return false;
        }
        
        try {
            sql = "select * from tbl_funcionarios where usuario_funcionario = ? and password_funcionario = ?;";
            ps = con.prepareStatement(sql); // prepara SQL
            ps.setString(1, usuario_funcionario); // Configura Parametros
            ps.setString(2, senha_funcionario); // Configura Parametros
            
            tab = ps.executeQuery(); // Executa comando SQL
            
            if (tab.next()) 
                return true;
            
            
            this.statusSQL = null; // armazena null se deu tudo certo
            
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao tentar buscar Funcionario! " + ex.getMessage();
        }
        return false;
    }
    public boolean buscarIdPorUser() {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "SELECT id_funcionario FROM tbl_funcionarios WHERE usuario_funcionario= ?";
            ps = con.prepareStatement(sql); 
            ps.setString(1, usuario_funcionario); 
           tab = ps.executeQuery(); 

          
            if (tab.next()) {
               
               id_funcionario = tab.getInt("id_funcionario");
      
                this.statusSQL = null;  // Limpa status em caso de sucesso
             return true;
            } else {
                this.statusSQL = "Funcionario não encontrado!";
              
            }

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar Funcionario! <br> " + ex.getMessage();
            
        } 
        
        return false;
    }
    
     public boolean VerificarRG() {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "select rg_funcionario from tbl_funcionarios where rg_funcionario = ?";
            ps = con.prepareStatement(sql); 
            ps.setString(1, rg_funcionario); 
           tab = ps.executeQuery(); 

          
            if (tab.next()) {
                this.statusSQL = null;  // Limpa status em caso de sucesso
             return true;
            } else {
                this.statusSQL = "Funcionario não encontrado!";
              
            }

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar Funcionario! <br> " + ex.getMessage();
            
        } 
        
        return false;
    }
      public boolean VerificarCPF() {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "select cpf_funcionario from tbl_funcionarios where cpf_funcionario = ?";
            ps = con.prepareStatement(sql); 
            ps.setString(1, cpf_funcionario); 
           tab = ps.executeQuery(); 

          
            if (tab.next()) {
                this.statusSQL = null;  // Limpa status em caso de sucesso
             return true;
            } else {
                this.statusSQL = "Funcionario não encontrado!";
              
            }

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar Funcionario! <br> " + ex.getMessage();
            
        } 
        
        return false;
    }
      
      public boolean VerificarUser() {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "select usuario_funcionario from tbl_funcionarios where usuario_funcionario = ?";
            ps = con.prepareStatement(sql); 
            ps.setString(1, usuario_funcionario); 
           tab = ps.executeQuery(); 

          
            if (tab.next()) {
                this.statusSQL = null;  // Limpa status em caso de sucesso
             return true;
            } else {
                this.statusSQL = "Funcionario não encontrado!";
              
            }

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar Funcionario! <br> " + ex.getMessage();
            
        } 
        
        return false;
    }
      
         public boolean DeletarFunc() {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "DELETE FROM tbl_funcionarios WHERE cpf_funcionario=?;";
            ps = con.prepareStatement(sql); 
            ps.setString(1, cpf_funcionario); 
            ps.executeUpdate(); 
            this.statusSQL = null;  // Limpa status em caso de sucesso
            return true;
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao deletar Funcionario! <br> " + ex.getMessage();
            
        } 
        
        return false;
    }
        public void AlterarFunc(String cpf) {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "UPDATE tbl_funcionarios set nome_funcionario = ?, cpf_funcionario = ?, rg_funcionario =?, cargo_funcionario = ?,salario_funcionario = ?, usuario_funcionario= ?,password_funcionario = ? where cpf_funcionario = ?;";
            ps = con.prepareStatement(sql); 
            ps.setString(1, nome_funcionario);
            ps.setString(2, cpf_funcionario);
            ps.setString(3, rg_funcionario);
            ps.setString(4, cargo_funcionario);
            ps.setDouble(5, salario_funcionario);
            ps.setString(6, usuario_funcionario);
            ps.setString(7, senha_funcionario);
            ps.setString(8, cpf);

            ps.executeUpdate(); 
            this.statusSQL = null;  // Limpa status em caso de sucesso
       
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao Alterar Funcionario! <br> " + ex.getMessage();
            ex.printStackTrace();
        } 
      
    }
        
        public boolean buscarFuncPorUser() {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "SELECT nome_funcionario, cargo_funcionario, rg_funcionario FROM tbl_funcionarios WHERE usuario_funcionario = ?";
            ps = con.prepareStatement(sql); 
            ps.setString(1, usuario_funcionario); 
           tab = ps.executeQuery(); 

          
            if (tab.next()) {
               
               nome_funcionario = tab.getString("nome_funcionario");
               cargo_funcionario= tab.getString("cargo_funcionario");
                rg_funcionario  = tab.getString("rg_funcionario");
                
           
                
                this.statusSQL = null;  // Limpa status em caso de sucesso
             return true;
            } else {
                this.statusSQL = "Cliente não encontrado!";
              
            }

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar cliente! <br> " + ex.getMessage();
            
        } 
        
        return false;
    }
    
   
   
  
}
