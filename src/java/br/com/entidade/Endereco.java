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
public class Endereco {
    private int codigo;
    private int id_clienteEndereco;

    
    private String cep;
    private String cidade;
    private String uf;
    private String bairro;
    private String rua;
    private String numero;
    private String complemento;
    private String pRef;
    
    public int getId_cliente() {
        return id_clienteEndereco;
    }

    public void setId_cliente(int id_cliente) {
        this.id_clienteEndereco = id_cliente;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getpRef() {
        return pRef;
    }

    public void setpRef(String pRef) {
        this.pRef = pRef;
    }
        
}
