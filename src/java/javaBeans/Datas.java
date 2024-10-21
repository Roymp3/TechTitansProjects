
package javaBeans;
import java.sql.SQLException;
import java.sql.Timestamp;
public class Datas extends Conectar{
    private int id_data;
    private Timestamp data_datas;
    private int id_cliente;
    private int id_funcionario;
    private int id_status;
    private int id_corte;

    public int getId_data() {
        return id_data;
    }

    public void setId_data(int id_data) {
        this.id_data = id_data;
    }

    public Timestamp getData_datas() {
        return data_datas;
    }

    public void setData_datas(Timestamp data_datas) {
        this.data_datas = data_datas;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_funcionario() {
        return id_funcionario;
    }

    public void setId_funcionario(int id_funcionario) {
        this.id_funcionario = id_funcionario;
    }

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }
       public int getId_corte() {
        return id_corte;
    }

    public void setId_corte(int id_corte) {
        this.id_corte = id_corte;
    }
    
    public void incluir() {
        try {
            sql = "insert into tbl_datas(data_datas, id_funcionario) values (?,?);";
            ps = con.prepareStatement(sql); // prepara SQL
            ps.setTimestamp(1, data_datas);
            ps.setInt(2, id_funcionario);// Configura Parametros

            ps.executeUpdate(); // executa comando SQL
            this.statusSQL = null; // armazena null se deu tudo certo
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao incluir usuario ! <br> " + ex.getMessage();
        }
    }

       public void InserirDatasAuto(){
           try {
               sql =  "CALL InserirDatasProgramadas();";
                      
            ps = con.prepareStatement(sql); // prepara SQL
            ps.executeUpdate(); // executa comando SQL
            this.statusSQL = null; // armazena null se deu tudo certo
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao incluir Datas automaticamente ! <br> " + ex.getMessage();
        }

      }
       public boolean VerificarData() {
        try {
            sql = "select data_datas, id_funcionario from tbl_datas where data_datas = ? and id_funcionario = ?;";
            ps = con.prepareStatement(sql); // prepara SQL
            ps.setTimestamp(1, data_datas);
            ps.setInt(2, id_funcionario);// Configura Parametros
            tab = ps.executeQuery();

            if (tab.next()) {
                this.statusSQL = null;  // Limpa status em caso de sucesso
                return true;
            } else {
                this.statusSQL = "Data não encontrada!";

            }
        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar data! <br> " + ex.getMessage();
        }
        return false;
    }
       
    
    
}
