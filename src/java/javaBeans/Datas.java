
package javaBeans;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
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
               sql =  "CALL InserirDatasProgramadas(?);";
                      
            ps = con.prepareStatement(sql);
            ps.setInt(1, id_funcionario);// prepara SQL
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
       
       public boolean VerificarDatas() {
    try {
       
        String[] horarios = {
            "09:00:00", "10:00:00", "11:00:00", 
            "14:00:00", "15:00:00", "16:00:00", 
            "17:00:00", "18:00:00", "19:00:00", 
            "20:00:00"
        };

        for (String horario : horarios) {
            sql = "select data_datas, id_funcionario from tbl_datas where data_datas = ? and id_funcionario = ?;";
            ps = con.prepareStatement(sql);
            ps.setTimestamp(1, Timestamp.valueOf(LocalDateTime.now().toLocalDate().atTime(LocalTime.parse(horario))));
            ps.setInt(2, id_funcionario);
            tab = ps.executeQuery();
            
            if (tab.next()) {
                this.statusSQL = "Horário " + horario + " já foi cadastrado!";
                return true;  // If any time already exists, return true
            }
        }

        this.statusSQL = "Todos os horários estão disponíveis.";
        return false;

    } catch (SQLException ex) {
        this.statusSQL = "Erro ao verificar datas! <br> " + ex.getMessage();
        return false;
    }
}           
         public List<Datas> DatasDisponiveis() {
          List<Datas> listaDatas = new ArrayList<>();
          
        try {
            sql = "SELECT data_datas, tbl_status.nome_status\n"
                    + "FROM tbl_datas \n"
                    + "LEFT JOIN tbl_status \n"
                    + "ON tbl_datas.id_status = tbl_status.id_status where nome_status is null;";
            ps = con.prepareStatement(sql); 
           tab = ps.executeQuery(); 

          
            while (tab.next()) {
               Datas dt = new Datas();
               dt.setData_datas(tab.getTimestamp("data_datas"));
               listaDatas.add(dt);
               
                this.statusSQL = null;  // Limpa status em caso de sucesso
  
            } 

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar cliente! <br> " + ex.getMessage();
            
        } 
        return listaDatas;
     }
 
            public List<Datas> BuscatIdFuncData() {
          List<Datas> listIdsFuncData = new ArrayList<>();
          
        try {
            sql = "SELECT \n"
                    + "    data_datas, \n"
                    + "     tbl_datas.id_funcionario,\n"
                    + "    tbl_status.nome_status\n"
                    + "FROM \n"
                    + "    tbl_datas\n"
                    + "LEFT JOIN \n"
                    + "    tbl_status \n"
                    + "ON \n"
                    + "    tbl_datas.id_status = tbl_status.id_status\n"
                    + "LEFT JOIN \n"
                    + "    tbl_funcionarios \n"
                    + "ON \n"
                    + "    tbl_datas.id_funcionario = tbl_funcionarios.id_funcionario\n"
                    + "WHERE \n"
                    + "    tbl_status.nome_status IS NULL and data_datas = ?;";
            ps = con.prepareStatement(sql); 
            ps.setTimestamp(1, data_datas);
           tab = ps.executeQuery(); 

          
            while (tab.next()) {
               Datas dt = new Datas();
               dt.setId_funcionario(tab.getInt("id_funcionario"));
               listIdsFuncData.add(dt);
               
                this.statusSQL = null;  // Limpa status em caso de sucesso
  
            } 

        } catch (SQLException ex) {
            this.statusSQL = "Erro ao buscar cliente! <br> " + ex.getMessage();
            
        } 
        return listIdsFuncData;
     }
            
        
       
    
    
}
