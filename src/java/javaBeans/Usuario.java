package javaBeans;

import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Usuario extends Conectar {
    // Definindo os campos
    private int id_cliente;
    private String nome_cliente;
    private String sobrenome_cliente;
    private String cpf_cliente;
    private String numero_cliente;
    private String usuario_cliente;
    private String password_cliente;
    private String statusSQL; // Campo para armazenar o status SQL

    // Adicionando os setters para cada campo
    public void setNomeCliente(String nome_cliente) {
        this.nome_cliente = nome_cliente;
    }

    public void setSobrenomeCliente(String sobrenome_cliente) {
        this.sobrenome_cliente = sobrenome_cliente;
    }

    public void setCpfCliente(String cpf_cliente) {
        this.cpf_cliente = cpf_cliente;
    }

    public void setNumeroCliente(String numero_cliente) {
        this.numero_cliente = numero_cliente;
    }

    public void setUsuarioCliente(String usuario_cliente) {
        this.usuario_cliente = usuario_cliente;
    }

    public void setPasswordCliente(String password_cliente) {
        this.password_cliente = password_cliente;
    }

    // Método para verificar o login
    public boolean getLogin() {
        // Verifica se os valores não são nulos ou vazios
        if (usuario_cliente == null || password_cliente == null || 
            usuario_cliente.isEmpty() || password_cliente.isEmpty()) {
            this.statusSQL = "Usuário ou senha não podem ser nulos ou vazios.";
            return false; // Retorna falso se um dos campos for nulo ou vazio
        }
    
        try {
            // Consulta SQL para verificar o login baseado no usuário e senha fornecidos
            String sql = "SELECT * FROM tbl_clientes WHERE usuario_cliente = ? AND password_cliente = ?";
            ps = con.prepareStatement(sql); // Prepara a instrução SQL
            ps.setString(1, usuario_cliente); // Configura o parâmetro para o usuário
            ps.setString(2, password_cliente); // Configura o parâmetro para a senha
    
            ResultSet tab = ps.executeQuery(); // Executa a consulta SQL
    
            if (tab.next()) {
                return true; // Retorna true se encontrar o usuário
            }
    
            this.statusSQL = null; // Armazena null se deu tudo certo
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao tentar buscar Usuário! " + ex.getMessage(); // Armazena mensagem de erro
        } finally {
            // Aqui você pode fechar a conexão se necessário
            closeResources();
        }
    
        return false; // Retorna false se o usuário não foi encontrado
    }

    // Método para incluir um usuário no banco de dados
    public void incluir() {
        try {
            String sql = "INSERT INTO tbl_clientes (nome_cliente, sobrenome_cliente, cpf_cliente, numero_cliente, usuario_cliente, password_cliente) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql); // Prepara SQL
            ps.setString(1, nome_cliente); // Configura parâmetros
            ps.setString(2, sobrenome_cliente);
            ps.setString(3, cpf_cliente);
            ps.setString(4, numero_cliente);
            ps.setString(5, usuario_cliente);
            ps.setString(6, password_cliente); // Aqui também considere usar um hash para a senha
            ps.executeUpdate(); // Executa comando SQL
            this.statusSQL = null; // Armazena null se deu tudo certo
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao incluir usuário! <br> " + ex.getMessage();
        } finally {
            // Aqui você pode fechar a conexão se necessário
            closeResources();
        }
    }

    // Método para fechar recursos (conexão, PreparedStatement)
    private void closeResources() {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace(); // Log de erro ao fechar os recursos
        }
    }
}