package javaBeans;
import java.sql.DriverManager; // Driver para abrir Conexão 
import java.sql.ResultSet;
import java.sql.SQLException;  // Tratamento de Erros SQL
import java.sql.Connection;    // Armazena a Conexão Aberta
import java.sql.PreparedStatement;

public class Conectar {
public Connection con;       // variávei que armazena a conexão com o SQL
public String sql;           // variável que armazena os comandos SQL  
public PreparedStatement ps; // objeto que prepara o sql
public ResultSet tab;        // Armazena um conjunto de Registros 
public String MeuBanco = "naregua";      // Nome do banco a ser criado
public String servidor = "jdbc:mysql:    //localhost:3306"; // caminho do servidor SQL 
public String usuario = "root";  // Login nome do usuario do banco SQL
public String senha = "";        // Senha do Banco SQL
public String statusSQL;
/* Na variável statusSQl conterá null quando não tiver erros 
Mas quando haver erros conterá a mensagem de erro capturada
Pela excessão da clausula try. */
                                        
    
public Conectar() {
try {
 Class.forName("com.mysql.cj.jdbc.Driver"); // Carrega o driver JDBC
 con=DriverManager.getConnection(servidor, usuario, senha );
       
 this.criarBanco(); // Função que cria o banco de dados
        
 statusSQL = null;  // Armazena NULL se não haver erros nos comandos SQL
} catch (ClassNotFoundException ex) {
  statusSQL = "Driver JDBC não encontrado! " + ex.getMessage();
      } catch (SQLException ex) {
  statusSQL = "Servidor fora do ar ou comando SQL ! " + ex.getMessage();
     }}

    
 public void criarBanco() {
        try {
            sql = "create database if not exists " + this.MeuBanco; // armazena sql
            ps = con.prepareStatement(sql); // prepara o comando
            ps.executeUpdate(); // Executa o comando SQL
            sql = "use " + this.MeuBanco;
            ps = con.prepareStatement(sql);
            ps.executeUpdate(); // Executa o comando SQL dentro do servidor 
            
            sql = "create table if not exists tbl_clientes ( id_cliente int AUTO_INCREMENT PRIMARY KEY,"
                    + "nome_cliente varchar(50) not null,"
                    + "usuario_cliente varchar(50) not null,"
                    + "email_cliente varchar(255) not null,"
                    + "password_cliente varchar(255) not null,"
                    + "numero_cliente varchar(10) not null,"
                    + "cpf_cliente varchar(20) not null); ";
            ps = con.prepareStatement(sql);
            ps.executeUpdate(); // Executa o comando SQL dentro do servidor
            
              sql = "create table if not exists tbl_cortes ( id_corte int AUTO_INCREMENT PRIMARY KEY,"
                    + "nome_corte varchar(70),"
                    + "preco_corte DECIMAL(50));";
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
            
          sql = "create table if not exists tbl_funcionarios ( id_funcionario int AUTO_INCREMENT PRIMARY KEY,"
                    + "nome_funcionario varchar(70),"
                    + "cargo_funcionario varchar(50),"
                    + "usuario_funcionario varchar(50) not null,"
                    + "password_funcionario varchar(255) not null,"
                    + "cpf_funcionario VARCHAR(15),"
                    + "rg_funcionario VARCHAR(15),"
                    + "salario_funcionario DECIMAL(10,2));";
         
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
            sql = "create table if not exists tbl_status ( id_status int AUTO_INCREMENT PRIMARY KEY,"
                    + "nome_status varchar(30));";
         
            ps = con.prepareStatement(sql);
            ps.executeUpdate(); 
            
            
           sql = "create table if not exists tbl_datas ( id_data int AUTO_INCREMENT PRIMARY KEY,"
                    + "data_datas datetime,"
                    + "id_cliente int," 
                    + "id_funcionario int,"
                    + "id_status int,"
                    + "id_corte int,"
                    + "FOREIGN KEY (id_corte) REFERENCES tbl_cortes(id_corte),"
                    + "FOREIGN KEY(id_cliente) REFERENCES tbl_clientes(id_cliente),"
                   +  "FOREIGN KEY(id_funcionario) REFERENCES tbl_funcionarios(id_funcionario),"
                   +  "FOREIGN KEY(id_status) REFERENCES tbl_status(id_status));";
         
            ps = con.prepareStatement(sql);
            ps.executeUpdate(); 
            
            sql = "CREATE PROCEDURE InserirDatasProgramadas()"
                    + "BEGIN"
                    + "    DECLARE dataAtual DATETIME;"
                    + "    SET dataAtual = NOW();"
                    + "    INSERT INTO tbl_datas (data_datas) VALUES"
                    + "        (DATE_FORMAT(dataAtual, '%Y-%m-%d 09:00:00')),"
                    + "        (DATE_FORMAT(dataAtual, '%Y-%m-%d 10:00:00')),"
                    + "        (DATE_FORMAT(dataAtual, '%Y-%m-%d 11:00:00')),"
                    + "		(DATE_FORMAT(dataAtual, '%Y-%m-%d 14:00:00')),"
                    + "		(DATE_FORMAT(dataAtual, '%Y-%m-%d 15:00:00')),"
                    + "		(DATE_FORMAT(dataAtual, '%Y-%m-%d 16:00:00')),"
                    + "		(DATE_FORMAT(dataAtual, '%Y-%m-%d 17:00:00')),"
                    + "		(DATE_FORMAT(dataAtual, '%Y-%m-%d 18:00:00')),"
                    + "		(DATE_FORMAT(dataAtual, '%Y-%m-%d 19:00:00')),"
                    + "        (DATE_FORMAT(dataAtual, '%Y-%m-%d 20:00:00'));"
                    + "END";
         
            ps = con.prepareStatement(sql);
            ps.executeUpdate(); 


            statusSQL = null; // Coloca null nas operações bem sucedidas

        } catch (SQLException err) {
            statusSQL = "Erro ao executar SQL " + err.getMessage(); // houve erros
        }
        
  
        
        
        
        
        
    }
}
