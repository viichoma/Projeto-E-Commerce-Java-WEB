/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package VO;

import java.util.List;

/**
 *
 * @author unico
 */
public class ProdutoVO {

    private int id;
    private String nome;
    private String ds_produto;
    private double preco;
    private String tamanho;
    private List<String> tamanhos;
    private String categoria;
    private String genero;
    private int quantidade;
    private String ds_img;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDs_produto() {
        return ds_produto;
    }

    public void setDs_produto(String ds_produto) {
        this.ds_produto = ds_produto;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getTamanho() {
        return tamanho;
    }

    public void setTamanho(String tamanho) {
        this.tamanho = tamanho;
    }

    public List<String> getTamanhos() {
        return tamanhos;
    }

    public void setTamanhos(List<String> tamanhos) {
        this.tamanhos = tamanhos;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public String getDs_img() {
        return ds_img;
    }

    public void setDs_img(String ds_img) {
        this.ds_img = ds_img;
    }

}
