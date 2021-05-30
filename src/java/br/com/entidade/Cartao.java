/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.entidade;

/**
 *
 * @author Mathe
 */
public class Cartao {
    private int id;
    private String numero;
    private String titular;
    private String dataValidade;
    private String cvv; 
    private int id_clienteCartao;

    public int getId_clienteCartao() {
        return id_clienteCartao;
    }

    public void setId_clienteCartao(int id_clienteCartao) {
        this.id_clienteCartao = id_clienteCartao;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getTitular() {
        return titular;
    }

    public void setTitular(String titular) {
        this.titular = titular;
    }

    public String getDataValidade() {
        return dataValidade;
    }

    public void setDataValidade(String dataValidade) {
        this.dataValidade = dataValidade;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }
      
}
