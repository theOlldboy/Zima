/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Pagamento;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;


/**
 *
 * @author Mathe
 */
public class ManterPagamento extends DAO {
    
    public void gerarPagamento() throws Exception {
    try {
    abrirBanco();
    String query = "INSERT INTO pagamento(codigo,cod_pedido,forma, status, data) "
            + "values(null,null,null,null,null)";
    pst=(PreparedStatement) con.prepareStatement(query);
    pst.execute();
    fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro " + e.getMessage());
    }
    }
    
    public void preencherPagamento(Pagamento pag, int codPagamento) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE pagamento SET cod_pedido=?, forma=?, status=?, data=? where codigo=?";
    pst = con.prepareStatement(query);
    pst.setInt(1, pag.getCodPedido());
    pst.setString(2, pag.getForma());
    pst.setString(3, pag.getStatus());   
    pst.setDate(4, new java.sql.Date(Calendar.getInstance().getTimeInMillis()));
    pst.setInt(5, codPagamento);
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
    
    public int pesquisarPagamentoPedido() throws Exception {
    try {
            int ultimoCodigoInserido;
            //System.out.println(" Chegou no pesquisar registo" + id);
            abrirBanco();
            String query = "SELECT LAST_INSERT_ID(codigo) as ultimoInserido from pagamento order by LAST_INSERT_ID(codigo) desc limit 1";
            pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                ultimoCodigoInserido = rs.getInt("ultimoInserido");
                return ultimoCodigoInserido;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return 0;
	}

    public Pagamento pesquisarPagamento(int codigoPedido) {
            try {
            Pagamento pg = new Pagamento();
            abrirBanco();
            String query = "select * FROM pagamento where cod_pedido=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, codigoPedido);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                pg.setCodigo(rs.getInt("codigo"));
                pg.setForma(rs.getString("forma"));
                pg.setData(rs.getDate("data"));
                pg.setStatusPago();
                return pg;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return null;
	}
    }
