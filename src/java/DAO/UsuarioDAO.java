
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
    
    //Método para gravar um usuario no Banco de Dados
    public boolean gravar(UsuarioVO user) {
            try {
            Connection con = new Conexao().estabeleceConexao(); // Estabelece conexão com o BD
            if (con != null)
            {
            PreparedStatement ps; // Estrutura o sql
            String sql = "insert into usuario (DS_NOME, DS_EMAIL, DS_SENHA) values ( ?, ?, ?)";
            ps = con.prepareStatement(sql);  // Prepara uma declaração SQL para execução em um banco de dados.
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
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
        Connection con = null; //conexão com o bd
        PreparedStatement ps = null; // estrutura o sql
        ResultSet rs = null; //armazenará o resultado do bd
        try {
        con = new Conexao().estabeleceConexao();
        if(con != null) {
            String sql = "select 1 from usuario where DS_EMAIL = ? and DS_SENHA = ? "; // SQL buscando retorno onde email e senha igual aos parametros
            ps = con.prepareStatement(sql); // Prepara uma declaração SQL para execução em um banco de dados.
            ps.setString(1, email);
            ps.setString(2, senha);
            rs = ps.executeQuery(); // Executa a consulta SQL preparada anteriormente e armazena o resultado
            return rs.next(); // Retorna resultado da consulta
        }
        }  catch (SQLException erro) {
        System.err.print("Exceção gerada ao tentar buscar os dados: " + erro.getMessage());
        return false;
    } finally {
        // Fechando conexões e recursos
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.err.print("Erro ao fechar conexão: " + e.getMessage());
        }
    }
    return false;
    }
    
    public boolean update(UsuarioVO user) {
            try {
            Connection con = new Conexao().estabeleceConexao();
            if (con != null)
            {
                PreparedStatement ps;
                String sql = "update usuario set DS_NOME = ?, DS_EMAIL = ?, DS_SENHA = ? where CD_USUARIO = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, user.getUsername());
                ps.setString(2, user.getEmail());
                ps.setString(3, user.getPassword());
                ps.setString(4, String.valueOf(user.getId()));

            if (ps.executeUpdate() != 0) {
                    System.out.println("Sucesso ao atualizar");
                } else {
                    System.out.println("Não foi possível atualizar");
                }
                con.close();
            }
                } catch (SQLException erro) {
            System.out.println("Exceção causada na inserção");
        }
         return true;
   }    
 
        public Integer getID(String email, String senha){
        Connection con = null; //conexão com o bd
        PreparedStatement ps = null; // estrutura o sql
        ResultSet rs = null; //armazenará o resultado do bd
        Integer userId = null;
        try {
        con = new Conexao().estabeleceConexao();
        if(con != null) {
            String sql = "select CD_USUARIO from usuario where DS_EMAIL = ? and DS_SENHA = ? ";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, senha);
            rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("CD_USUARIO");
                        }
        }
        }
        catch (SQLException erro) {
        System.err.print("Exceção gerada ao tentar buscar os dados: " + erro.getMessage());
        
    } finally {
        // Fechando conexões e recursos
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.err.print("Erro ao fechar conexão: " + e.getMessage());
        }
    }
    
    return null;
    }
        
    public String getUsername(String email, String senha){
        Connection con = null; //conexão com o bd
        PreparedStatement ps = null; // estrutura o sql
        ResultSet rs = null; //armazenará o resultado do bd
        String username = null;
        try {
        con = new Conexao().estabeleceConexao();
        if(con != null) {
            String sql = "select DS_NOME from usuario where DS_EMAIL = ? and DS_SENHA = ? ";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, senha);
            rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString("DS_NOME");
                        }
        }
        }
        catch (SQLException erro) {
        System.err.print("Exceção gerada ao tentar buscar os dados: " + erro.getMessage());
        
    } finally {
        // Fechando conexões e recursos
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.err.print("Erro ao fechar conexão: " + e.getMessage());
        }
    }
    
    return null;
    }
 
        public boolean ExcluirConta(int id){
        Connection con = null; //conexão com o bd
        PreparedStatement ps = null; // estrutura o sql
        ResultSet rs = null; //armazenará o resultado do bd
        try {
        con = new Conexao().estabeleceConexao();
        if(con != null) {
            String sql = "delete from usuario where CD_USUARIO = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            if(ps.executeUpdate()!=0){
                    con.close();
                    return true;
                }
        }
        }
        catch (SQLException erro) {
        System.err.print("Exceção gerada ao tentar buscar os dados: " + erro.getMessage());
        
    } finally {
        // Fechando conexões e recursos
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            System.err.print("Erro ao fechar conexão: " + e.getMessage());
        }
    }
    
    return false;
    }    
    
}

