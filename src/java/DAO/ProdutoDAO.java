/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import VO.CartVO;
import VO.ProdutoVO;
import connection.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author unico
 */
public class ProdutoDAO {

    private Connection con; //conexão com o bd
    private String sql;
    private PreparedStatement ps; // estrutura o sql
    private ResultSet rs; //armazenará o resultado do bd

    public ProdutoDAO() throws SQLException {
        this.con = new Conexao().estabeleceConexao(); // Estabelece a conexão com o BD
    }

    //Método para gravar um usuario no Banco de Dados
    public boolean cadastrar(ProdutoVO product) {
        try {
            Connection con = new Conexao().estabeleceConexao(); // Estabelece conexão com o BD
            if (con != null) {
                PreparedStatement ps; // Estrutura o sql
                String sql = "insert into produto "
                        + "(DS_NOME, DS_PRODUTO, VL_PRECO, DS_TAMANHO, DS_CATEGORIA, DS_GENERO, QT_QUANTIDADE, DS_IMG)"
                        + " values ( ?, ?, ?,  ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);  // Prepara uma declaração SQL para execução em um banco de dados.
                ps.setString(1, product.getNome());
                ps.setString(2, product.getDs_produto());
                ps.setString(3, Double.toString(product.getPreco()));
                ps.setString(4, product.getTamanho());
                ps.setString(5, product.getCategoria());
                ps.setString(6, product.getGenero());
                ps.setString(7, Integer.toString(product.getQuantidade()));
                ps.setString(8, product.getDs_img());

                if (ps.executeUpdate() != 0) {
                    System.out.println("Sucesso ao cadastrar produto");
                } else {
                    System.out.println("Não foi possível cadastrar produto");
                }
                con.close();
            }
        } catch (SQLException erro) {
            System.out.println("Exceção causada na inserção");
        }
        return true;
    }

    public ArrayList<ProdutoVO> ListarProdutos() {
        PreparedStatement ps; // estrutura o sql
        ResultSet rs; //armazenará o resultado do bd
        Connection con; //conexão com o bd

        try {
            con = new Conexao().estabeleceConexao(); // Estabelece conexão com o BD
            if (con != null) {
                String sql = "select CD_PRODUTO, DS_NOME, DS_PRODUTO, VL_PRECO, DS_TAMANHO, QT_QUANTIDADE, DS_CATEGORIA, DS_IMG from produto";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                ArrayList<ProdutoVO> lista = new ArrayList<>();
                while (rs.next()) {
                    //setar os valores dentro de um objeto (Produto)
                    //adicionar este objeto a uma list
                    ProdutoVO p = new ProdutoVO();
                    p.setId(rs.getInt("CD_PRODUTO"));
                    p.setNome(rs.getString("DS_NOME"));
                    p.setDs_produto(rs.getString("DS_PRODUTO"));
                    p.setPreco(rs.getDouble("VL_PRECO"));
                    p.setTamanho(rs.getString("DS_TAMANHO"));
                    p.setCategoria(rs.getString("DS_CATEGORIA"));
                    p.setQuantidade(rs.getInt("QT_QUANTIDADE"));
                    p.setDs_img(rs.getString("DS_IMG"));
                    lista.add(p);
                }
                con.close();
                return lista;
            } else {
                return null;
            }
        } catch (SQLException erro) {
            System.err.print("Exceção gerada ao tentar buscar os dados: " + erro.getMessage());
            return null;
        }
    }

    // Método para buscar um produto por ID
    public ProdutoVO getProdutoById(int id) {
        ProdutoVO product = null;
        try {
            Connection con = new Conexao().estabeleceConexao(); // Estabelece conexão com o BD
            if (con != null) {
                String sql = "SELECT CD_PRODUTO, DS_NOME, DS_PRODUTO, VL_PRECO, DS_TAMANHO, QT_QUANTIDADE, DS_CATEGORIA, DS_GENERO, DS_IMG FROM produto WHERE CD_PRODUTO = ?";
                PreparedStatement ps = con.prepareStatement(sql); // Prepara a declaração SQL
                ps.setInt(1, id); // Define o parâmetro do ID na declaração SQL
                ResultSet rs = ps.executeQuery(); // Executa a consulta e armazena o resultado em 'rs'
                if (rs.next()) { // Verifica se há um resultado na consulta
                    // Cria um novo objeto 'ProdutoVO' e define os dados
                    product = new ProdutoVO();
                    product.setId(rs.getInt("CD_PRODUTO"));
                    product.setNome(rs.getString("DS_NOME"));
                    product.setDs_produto(rs.getString("DS_PRODUTO"));
                    product.setPreco(rs.getDouble("VL_PRECO"));
                    product.setTamanho(rs.getString("DS_TAMANHO"));
                    product.setCategoria(rs.getString("DS_CATEGORIA"));
                    product.setGenero(rs.getString("DS_GENERO"));
                    product.setQuantidade(rs.getInt("QT_QUANTIDADE"));
                    product.setDs_img(rs.getString("DS_IMG"));

                    // Obter tamanhos
                    List<String> tamanhos = getTamanhosByProdutoId(product.getId());
                    product.setTamanhos(tamanhos);
                }
                con.close();
            }
        } catch (SQLException erro) {
            System.err.print("Exceção gerada ao tentar buscar os dados: " + erro.getMessage());
        }
        return product;
    }

    // Método para buscar um tamanho pelo ID do produto
    public List<String> getTamanhosByProdutoId(int produtoId) {
        List<String> tamanhos = new ArrayList<>();
        try {
            Connection con = new Conexao().estabeleceConexao();
            if (con != null) {
                String sql = "SELECT DS_TAMANHO FROM produto_tamanhos WHERE CD_PRODUTO = ?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, produtoId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    tamanhos.add(rs.getString("DS_TAMANHO"));
                }
                con.close();
            }
        } catch (SQLException erro) {
            System.err.print("Exceção gerada ao tentar buscar os tamanhos: " + erro.getMessage());
        }
        return tamanhos;
    }

    public boolean ExcluirProduto(int id) {
        Connection con = null; //conexão com o bd
        PreparedStatement ps = null; // estrutura o sql
        ResultSet rs = null; //armazenará o resultado do bd
        try {
            con = new Conexao().estabeleceConexao();
            if (con != null) {
                String sql = "delete from produto where CD_PRODUTO = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                if (ps.executeUpdate() != 0) {
                    con.close();
                    return true;
                }
            }
        } catch (SQLException erro) {
            System.err.print("Exceção gerada ao tentar buscar os dados: " + erro.getMessage());

        } finally {
            // Fechando conexões e recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.err.print("Erro ao fechar conexão: " + e.getMessage());
            }
        }

        return false;
    }

    public boolean updateProd(ProdutoVO product) {
        try {
            Connection con = new Conexao().estabeleceConexao();
            if (con != null) {
                PreparedStatement ps;
                String sql = "UPDATE produto SET "
                        + "DS_NOME = ?, DS_PRODUTO = ?, VL_PRECO = ?, DS_TAMANHO = ?, DS_CATEGORIA = ?, DS_GENERO = ?, QT_QUANTIDADE = ?, DS_IMG = ? "
                        + "WHERE CD_PRODUTO = ?";

                ps = con.prepareStatement(sql);
                ps.setString(1, product.getNome());
                ps.setString(2, product.getDs_produto());
                ps.setDouble(3, product.getPreco());
                ps.setString(4, product.getTamanho());
                ps.setString(5, product.getCategoria());
                ps.setString(6, product.getGenero());
                ps.setInt(7, product.getQuantidade());
                ps.setString(8, product.getDs_img());
                ps.setInt(9, product.getId());
                if (ps.executeUpdate() != 0) {
                    System.out.println("Sucesso ao atualizar");
                } else {
                    System.out.println("Não foi possível atualizar");
                }
                con.close();
            }
        } catch (SQLException erro) {
            System.out.println("Exceção causada na inserção: " + erro.getMessage());
        }
        return true;
    }

    public List<CartVO> getCartProducts(ArrayList<CartVO> cartList) {
        List<CartVO> products = new ArrayList<CartVO>();

        try {
            Connection con = new Conexao().estabeleceConexao(); // Estabelece conexão com o BD
            if (cartList.size() > 0) {
                for (CartVO item : cartList) {
                    sql = "select * from produto where CD_PRODUTO=?";
                    ps = this.con.prepareStatement(sql);
                    ps.setInt(1, item.getId());
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        CartVO row = new CartVO();
                        row.setId(rs.getInt("CD_PRODUTO"));
                        row.setNome(rs.getString("DS_NOME"));
                        row.setPreco(rs.getDouble("VL_PRECO") * item.getItem_quantidade());
                        row.setItem_quantidade(item.getItem_quantidade());
                        row.setDs_img(rs.getString("DS_IMG"));
                        products.add(row);
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }
}
