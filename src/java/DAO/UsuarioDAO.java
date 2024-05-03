
package DAO;
import VO.UsuarioVO;
import connection.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author unico
 */
public class UsuarioDAO {
    public boolean gravar(UsuarioVO user) {
            try {
            Connection con = new Conexao().estabeleceConexao();
            if (con != null)
            {
            PreparedStatement ps;
            String sql = "insert into usuarios (email, nome, senha) values (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            if (ps.executeUpdate() != 0) {
                    System.out.println("Sucesso ao inserir");
                } else {
                    System.out.println("Não foi possível inserir");
                }
                con.close();
            }
                } catch (SQLException erro) {
            System.out.println("Exceção causada na inserção");
        }
         return true;
   } 

    public boolean login(String email, String senha){
        try {
        Connection con = new Conexao().estabeleceConexao(); //conexão com o bd
        PreparedStatement ps; // estrutura o sql
        ResultSet rs; //armazenará o resultado do bd
        if(con != null) {
        String sql = "select email, senha from usuarios where email = '"+email+"' and senha = '"+senha+"' ";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        con.close();
        rs.next();
        
        }
        }  catch (SQLException erro) {
            System.err.print("Exceção gerada ao tentar buscar os dados: " + erro.getMessage());
            return false;
        }
        return true;
    
    }
    
        
}

