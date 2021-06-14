/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.entidade;

import java.sql.Date;

/**
 *
 * @author Mathe
 */
public class Pedido {
    private int codigo;
    private int cod_cli;
    private String status;
    private double valor;
    private Date data;
    private String cepEntrega;
    private String cidadeEntrega;
    private String ufEntrega;
    private String bairroEntrega;
    private String ruaEntrega;
    private String numeroEntrega;
    private String complementoEntrega;
    private String pRefEntrega;
    private String local;

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }
  
    public int getCod_cli() {
            return cod_cli;
    }

    public void setCod_cli(int cod_cli) {
        this.cod_cli = cod_cli;
    }
    public String getCepEntrega() {
        return cepEntrega;
    }

    public void setCepEntrega(String cepEntrega) {
        this.cepEntrega = cepEntrega;
    }

    public String getCidadeEntrega() {
        return cidadeEntrega;
    }

    public void setCidadeEntrega(String cidadeEntrega) {
        this.cidadeEntrega = cidadeEntrega;
    }

    public String getUfEntrega() {
        return ufEntrega;
    }

    public void setUfEntrega(String ufEntrega) {
        this.ufEntrega = ufEntrega;
    }

    public String getBairroEntrega() {
        return bairroEntrega;
    }

    public void setBairroEntrega(String bairroEntrega) {
        this.bairroEntrega = bairroEntrega;
    }

    public String getRuaEntrega() {
        return ruaEntrega;
    }

    public void setRuaEntrega(String ruaEntrega) {
        this.ruaEntrega = ruaEntrega;
    }

    public String getNumeroEntrega() {
        return numeroEntrega;
    }

    public void setNumeroEntrega(String numeroEntrega) {
        this.numeroEntrega = numeroEntrega;
    }

    public String getComplementoEntrega() {
        return complementoEntrega;
    }

    public void setComplementoEntrega(String complementoEntrega) {
        this.complementoEntrega = complementoEntrega;
    }

    public String getpRefEntrega() {
        return pRefEntrega;
    }

    public void setpRefEntrega(String pRefEntrega) {
        this.pRefEntrega = pRefEntrega;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

}
