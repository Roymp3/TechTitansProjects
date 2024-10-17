
package javaBeans;
import java.sql.SQLException;  

public class Cliente extends Conectar{
    private int id_cliente;
    private String nome_cliente;
    private String usuario_cliente;
    private String senha_cliente;
    private String email_cliente;
    private String numero_cliente;
    private String cpf_cliente;
    
    
    
    
     public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNome_cliente() {
        return nome_cliente;
    }

    public void setNome_cliente(String nome_cliente) {
        this.nome_cliente = nome_cliente;
    }

    public String getUsuario_cliente() {
        return usuario_cliente;
    }

    public void setUsuario_cliente(String usuario_cliente) {
        this.usuario_cliente = usuario_cliente;
    }

    public String getSenha_cliente() {
        return senha_cliente;
    }

    public void setSenha_cliente(String senha_cliente) {
        this.senha_cliente = senha_cliente;
    }

    public String getNumero_cliente() {
        return numero_cliente;
    }
     public String getEmail_cliente() {
        return email_cliente;
    }

    public void setEmail_cliente(String email_cliente) {
        this.email_cliente = email_cliente;
    }
    
    
    public void setNumero_cliente(String numero_cliente) {
        this.numero_cliente = numero_cliente;
    }

    public String getCpf_cliente() {
        return cpf_cliente;
    }

    public void setCpf_cliente(String cpf_cliente) {
        this.cpf_cliente = cpf_cliente;
    }
    
    
    
        public boolean getLogin() {
        if (usuario_cliente == null || senha_cliente == null || usuario_cliente.isEmpty() || senha_cliente.isEmpty()) {
                this.statusSQL = "Usuario ou senha não podem ser vazios";
                  return false;
        }
        
        try {
            sql = "select * from tbl_clientes where usuario_cliente = ? and password_cliente = ?;";
            ps = con.prepareStatement(sql); // prepara SQL
            ps.setString(1, usuario_cliente); // Configura Parametros
            ps.setString(2, senha_cliente); // Configura Parametros
            
            tab = ps.executeQuery(); // Executa comando SQL
            
            if (tab.next()) 
                return true;
            
            
            this.statusSQL = null; // armazena null se deu tudo certo
            
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao tentar buscar Usuário! " + ex.getMessage();
        }
        return false;
    }
    
    
    public void incluir() {
        try {
            sql = "insert into tbl_clientes(nome_cliente, usuario_cliente, password_cliente, numero_cliente, cpf_cliente,email_cliente ) "
                    + "values (?,?,?,?,?,?);";
            ps = con.prepareStatement(sql); // prepara SQL
            ps.setString(1, nome_cliente); // Configura Parametros
            ps.setString(2, usuario_cliente); // Configura Parametros
            ps.setString(3, senha_cliente); // Configura Parametros
            ps.setString(4, numero_cliente); // Configura Parametros
            ps.setString(5, cpf_cliente); 
            ps.setString(6, email_cliente);// Configura Parametros
            ps.executeUpdate(); // executa comando SQL
            this.statusSQL = null; // armazena null se deu tudo certo
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
        }
    }
    
        public boolean buscarClientePorUser() {
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "SELECT nome_cliente, numero_cliente, email_cliente FROM tbl_clientes WHERE usuario_cliente = ?";
            ps = con.prepareStatement(sql); 
            ps.setString(1, usuario_cliente); 
           tab = ps.executeQuery(); 

          
            if (tab.next()) {
               
               nome_cliente = tab.getString("nome_cliente");
               numero_cliente= tab.getString("numero_cliente");
                email_cliente  = tab.getString("email_cliente");
                
           
                
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

