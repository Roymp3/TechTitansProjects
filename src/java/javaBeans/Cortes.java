package javaBeans;

import java.sql.SQLException;

public class Cortes extends Conectar {
    private int id_corte;
    private String nome_corte;
    private double preco_corte;

    public int getId_corte() {
        return id_corte;
    }

    public void setId_corte(int id_corte) {
        this.id_corte = id_corte;
    }

    public String getNome_corte() {
        return nome_corte;
    }

    public void setNome_corte(String nome_corte) {
        this.nome_corte = nome_corte;
    }

    public double getPreco_corte() {
        return preco_corte;
    }

    public void setPreco_corte(double preco_corte) {
        this.preco_corte = preco_corte;
    }
    
    
     public void incluir() {
        try {
            sql = "insert into tbl_cortes(nome_corte, preco_corte) "
                    + "values (?,?);";
            ps = con.prepareStatement(sql); // prepara SQL
            ps.setString(1, nome_corte); // Configura Parametros
            ps.setDouble(2, preco_corte); // Configura Parametros
            ps.executeUpdate(); // executa comando SQL
            this.statusSQL = null; // armazena null se deu tudo certo
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
        }
    }
    
    
    
    
    
}
