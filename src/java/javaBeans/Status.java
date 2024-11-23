package javaBeans;

import java.sql.SQLException;

public class Status extends Conectar {
    
        private int id_status;
        private String nome_status;

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }

    public String getNome_status() {
        return nome_status;
    }

    public void setNome_status(String nome_status) {
        this.nome_status = nome_status;
    }
    
    
    
        public boolean BuscarNomeID() {
    try {
        sql = "SELECT nome_status FROM tbl_status WHERE id_status = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id_status);
        tab = ps.executeQuery();

        if (tab.next()) {
            nome_status = tab.getString("nome_status");
            return true;
        }
    } catch (SQLException ex) {
        this.statusSQL = "Erro ao buscar status! <br> " + ex.getMessage();
    }
    return false;
}
    
}
    




