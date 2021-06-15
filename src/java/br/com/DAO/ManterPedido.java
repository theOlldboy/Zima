/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Endereco;
import br.com.entidade.Pedido;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;


/**
 *
 * @author Mathe
 */
public class ManterPedido extends DAO{
    public void gerarPedido(Pedido p) throws Exception {
    try {
    abrirBanco();
    String query = "INSERT INTO pedido(codigo,data,status,cod_cli) "
            + "values(null,?,?,?)";
    pst=(PreparedStatement) con.prepareStatement(query);
    pst.setDate(1, new java.sql.Date(Calendar.getInstance().getTimeInMillis()));
    pst.setString(2, p.getStatus());
    pst.setInt(3, p.getCod_cli());
    pst.execute();
    fecharBanco();
    } catch (Exception e) {
        System.out.println("Erro " + e.getMessage());
    }
    }
    
    public void preencherValorPedido(double valorPedido, int codPedido) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE pedido SET valor=? WHERE codigo=?";
    pst = con.prepareStatement(query);
    pst.setDouble(1, valorPedido);
    pst.setInt(2, codPedido);    
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
    
    public void preencherEnderecoEntregaPedido(Endereco end, int codUsuario, String local) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE pedido SET cep_entrega=?,bairro_entrega=?,rua_entrega=?,numero_entrega=?,pRef_entrega=?,local=? WHERE codigo=?";
    pst = con.prepareStatement(query);
    pst.setString(1, end.getCep());
    pst.setString(2, end.getBairro());
    pst.setString(3, end.getRua());
    pst.setString(4, end.getNumero());
    pst.setString(5, end.getpRef());
    pst.setString(6, local);
    pst.setInt(7, codUsuario);
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
 
    public int pesquisarPedido() throws Exception {
    try {
            int ultimoCodigoInserido;
            //System.out.println(" Chegou no pesquisar registo" + id);
            abrirBanco();
            String query = "SELECT LAST_INSERT_ID(codigo) as ultimoInserido from pedido order by LAST_INSERT_ID(codigo) desc limit 1";
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
    
    //Metodo listar
    
    public ArrayList<Pedido> pesquisarTudo () throws Exception {
       ArrayList<Pedido> listausuarios = new ArrayList<Pedido>();
         try{
         abrirBanco();  
         String query = "select * FROM pedido";
         pst = con.prepareStatement(query);
         ResultSet rs = pst.executeQuery();
         Pedido p ;
         while (rs.next()){ 
           p = new Pedido();
           p.setCodigo(rs.getInt("codigo"));
           p.setValor(rs.getDouble("valor"));
           p.setData(rs.getDate("data"));
           p.setCepEntrega(rs.getString("cep_entrega"));
           p.setBairroEntrega(rs.getString("bairro_entrega"));
           p.setRuaEntrega(rs.getString("rua_entrega"));
           p.setNumeroEntrega(rs.getString("numero_entrega"));
           p.setpRefEntrega(rs.getString("pRef_entrega"));
           p.setStatus(rs.getString("status"));
           listausuarios.add(p); 
         } 
         fecharBanco();
       }catch (Exception e){
           System.out.println("Erro " + e.getMessage());
     } 
       return listausuarios;
     }
    
    public ArrayList<Pedido> pesquisarPedidosPorCliente (int codCli) throws Exception {
       ArrayList<Pedido> listaPedidos = new ArrayList<Pedido>();
         try{
         abrirBanco();  
         String query = "select * FROM pedido where cod_cli=?";
         pst = con.prepareStatement(query);
         pst.setInt(1, codCli);
         ResultSet rs = pst.executeQuery();
         Pedido p ;
         while (rs.next()){ 
           p = new Pedido();
           p.setCodigo(rs.getInt("codigo"));
           p.setValor(rs.getDouble("valor"));
           p.setData(rs.getDate("data"));
           p.setCepEntrega(rs.getString("cep_entrega"));
           p.setBairroEntrega(rs.getString("bairro_entrega"));
           p.setRuaEntrega(rs.getString("rua_entrega"));
           p.setNumeroEntrega(rs.getString("numero_entrega"));
           p.setpRefEntrega(rs.getString("pRef_entrega"));
           p.setStatus(rs.getString("status"));
           listaPedidos.add(p); 
         } 
         fecharBanco();
       }catch (Exception e){
           System.out.println("Erro " + e.getMessage());
     } 
       return listaPedidos;
     }
    
      public void deletar(Pedido p) throws Exception{
         abrirBanco();
         String query = "DELETE FROM pedido where codigo=?";
         pst=(PreparedStatement) con.prepareStatement(query);
         pst.setInt(1, p.getCodigo());
         pst.execute();
        fecharBanco();   
     }
      
      // metodo de pesquisar por id
      public Pedido pesquisarPedidoParaEntrega(int codigoPedido) throws Exception {
    try {
            Pedido p = new Pedido();
            //System.out.println(" Chegou no pesquisar registo" + id);
            abrirBanco();
            String query = "select * FROM pedido where codigo=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, codigoPedido);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
            p.setCodigo(rs.getInt("codigo"));
            p.setCod_cli(rs.getInt("cod_cli"));
            p.setValor(rs.getDouble("valor"));
            p.setData(rs.getDate("data"));
            p.setCepEntrega(rs.getString("cep_entrega"));
            p.setBairroEntrega(rs.getString("bairro_entrega"));
            p.setRuaEntrega(rs.getString("rua_entrega"));
            p.setNumeroEntrega(rs.getString("numero_entrega"));
            p.setpRefEntrega(rs.getString("pRef_entrega"));
            p.setStatus(rs.getString("status"));
            return p;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return null;
	}   
      
      public void alterar(Pedido p) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE pedido SET cod_produto=?,valor=?,local=? WHERE codigo=?";
    pst = con.prepareStatement(query);
    pst.setDouble(2, p.getValor());
    pst.setInt(4, p.getCodigo());
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
      
      public void alterarStatus(Pedido p) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE pedido SET status=? WHERE codigo=?";
    pst = con.prepareStatement(query);
    pst.setString(1, p.getStatus());
    pst.setInt(2, p.getCodigo());
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
}
