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
public String MeuBanco = "BD_barbearia";      // Nome do banco a ser criado
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
ps = con.prepareStatement ( sql ); // prepara o comando
ps.executeUpdate(); // Executa o comando SQL
               
sql = "use " + this.MeuBanco;
ps = con.prepareStatement ( sql );
ps.executeUpdate(); // Executa o comando SQL dentro do servidor 

sql = "create table if not exists tbl_salario ( " +
      "id_salario int auto_increment primary key, " +
      "valor_salario decimal(10,2) " + 
      ")"; // Fecha os parênteses
ps = con.prepareStatement(sql);
ps.executeUpdate(); // Executa o comando SQL dentro do servidor

// Criação da tabela tbl_status
sql = "create table if not exists tbl_status ( " +
      "id_status int auto_increment primary key, " +
      "nome_status varchar(30) " + 
      ")"; // Fecha os parênteses
ps = con.prepareStatement(sql);
ps.executeUpdate(); // Executa o comando SQL dentro do servidor

// Criação da tabela tbl_cargos
sql = "create table if not exists tbl_cargos ( " +
      "id_cargo int auto_increment primary key, " +
      "nome_cargo varchar(50) " + 
      ")"; // Fecha os parênteses
ps = con.prepareStatement(sql);
ps.executeUpdate(); // Executa o comando SQL dentro do servidor

// Criação da tabela tbl_clientes
sql = "create table if not exists tbl_clientes ( " +
      "id_cliente int auto_increment primary key, " +
      "nome_cliente varchar(50), " +
      "usuario_cliente varchar(50) not null, " +
      "password_cliente varchar(255) not null, " +
      "sobrenome_cliente varchar(50), " +
      "numero_cliente varchar(100), " +
      "cpf_cliente varchar(100) " + 
      ")"; // Fecha os parênteses
ps = con.prepareStatement(sql);
ps.executeUpdate(); // Executa o comando SQL dentro do servidor

// Criação da tabela tbl_cortes
sql = "create table if not exists tbl_cortes ( " +
      "id_corte int auto_increment primary key, " +
      "nome_corte varchar(70), " +
      "preco_corte decimal(10,2) " + 
      ")"; // Fecha os parênteses
ps = con.prepareStatement(sql);
ps.executeUpdate(); // Executa o comando SQL dentro do servidor

// Criação da tabela tbl_funcionarios
sql = "create table if not exists tbl_funcionarios ( " +
      "id_funcionario int auto_increment primary key, " +
      "nome_funcionario varchar(50), " +
      "usuario_funcionario varchar(50) not null, " +
      "password_funcionario varchar(255) not null, " +
      "sobrenome_funcionario varchar(50), " +
      "numero_funcionario int(11), " +
      "cpf_funcionario int(11), " +
      "id_cargo int, " +
      "id_salario int, " +
      "foreign key (id_cargo) references tbl_cargos(id_cargo), " +
      "foreign key (id_salario) references tbl_salario(id_salario) " +
      ")"; // Fecha os parênteses
ps = con.prepareStatement(sql);
ps.executeUpdate(); // Executa o comando SQL dentro do servidor

// Criação da tabela tbl_datas
sql = "create table if not exists tbl_datas ( " +
      "id_data int auto_increment primary key, " +
      "data datetime, " +
      "id_cliente int(11), " +
      "id_funcionario int(11), " +
      "id_corte int(11), " +
      "id_status int(11), " +
      "foreign key (id_cliente) references tbl_clientes(id_cliente), " +
      "foreign key (id_funcionario) references tbl_funcionarios(id_funcionario), " +
      "foreign key (id_corte) references tbl_cortes(id_corte), " +
      "foreign key (id_status) references tbl_status(id_status) " +
      ")"; // Fecha os parênteses
ps = con.prepareStatement(sql);
ps.executeUpdate(); // Executa o comando SQL dentro do servidor

statusSQL = null; // Coloca null nas operações bem sucedidas

        } catch (SQLException err) {
statusSQL = "Erro ao executar SQL " + err.getMessage(); // houve erros
        }}}
