/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package VO;

/**
 *
 * @author Mariane Martins Curi
 */
public class CartVO extends ProdutoVO {

    private int item_quantidade;

    public CartVO() {
    }

    public int getItem_quantidade() {
        return item_quantidade;
    }

    public void setItem_quantidade(int item_quantidade) {
        this.item_quantidade = item_quantidade;
    }
}
