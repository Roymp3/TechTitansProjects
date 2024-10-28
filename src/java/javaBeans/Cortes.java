package javaBeans;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
      public List<Cortes> buscarCortes() {
          List<Cortes> listaCorte = new ArrayList<>();
          
        try {
            // Consulta SQL para buscar o cliente pelo nome
            sql = "SELECT nome_corte, preco_corte from tbl_cortes";
            ps = con.prepareStatement(sql); 
           tab = ps.executeQuery(); 

          
            while (tab.next()) {
               Cortes corte = new Cortes();
               corte.setNome_corte( tab.getString("nome_corte"));
                corte.setPreco_corte( tab.getDouble("preco_corte"));
               listaCorte.add(corte);
               
                this.statusSQL = null;  // Limpa status em caso de sucesso
  
            } 

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar cliente! <br> " + ex.getMessage();
            
        } 
        return listaCorte;
     }
}
