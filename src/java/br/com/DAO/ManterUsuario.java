/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.DAO;

import br.com.entidade.Cartao;
import br.com.entidade.Endereco;
import br.com.entidade.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

/**
 *
 * @author Mathe
 */
public class ManterUsuario extends DAO {
    public void inserirDadosPessoaisUsuarioCliente(Usuario us) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO Usuario(codigo,nome,email,cpf,senha,telefone,tipo) "
                    + "values(null,?,?,?,?,?,?)";
            pst=(PreparedStatement) con.prepareStatement(query);
            pst.setString(1, us.getNome());
            pst.setString(2, us.getEmail());
            pst.setString(3, us.getCpf());
            pst.setString(4, us.getSenha());
            pst.setString(5, us.getTelefone());
            pst.setInt(6, us.getTipo());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
    
    public void inserirDadosCartaoUsuarioCliente(Cartao card) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO cartao(cod_usuario,titular,numero,cvv,dataValidade) "
                    + "values(null,?,?,?,?)";
            pst=(PreparedStatement) con.prepareStatement(query);
            pst.setString(1, card.getTitular());
            pst.setString(2, card.getNumero());
            pst.setString(3, card.getCvv());
            pst.setString(4, card.getDataValidade());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
    
    public void inserirEnderecoUsuarioCliente(Endereco end) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO endereco(cod_usuario,cep,rua,bairro,cidade,uf,numero,complemento, pRef) "
                    + "values(null,?,?,?,?,?,?,?,?)";
            pst=(PreparedStatement) con.prepareStatement(query);
            pst.setString(1, end.getCep());
            pst.setString(2, end.getRua());
            pst.setString(3, end.getBairro());
            pst.setString(4, end.getCidade());
            pst.setString(5, end.getUf());
            pst.setString(6, end.getNumero());
            pst.setString(7, end.getComplemento());
            pst.setString(8, end.getpRef());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
        public void inserirDadosPessoaisUsuarioAdministrador(Usuario us) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO Usuario(codigo,nome,email,cpf,senha,telefone,tipo) "
                    + "values(null,?,?,?,?,?,?)";
            pst=(PreparedStatement) con.prepareStatement(query);
            pst.setString(1, us.getNome());
            pst.setString(2, us.getEmail());
            pst.setString(3, us.getCpf());
            pst.setString(4, us.getSenha());
            pst.setString(5, us.getTelefone());
            pst.setInt(6, us.getTipo());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
        
    public Usuario pesquisarDadosPessoaisCliente(int id) throws Exception {
    try {
            Usuario us = new Usuario();
            abrirBanco();
            String query = "SELECT * FROM usuario where codigo=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                us.setCodigo(rs.getInt("codigo"));
                us.setNome(rs.getString("nome"));
                us.setSenha(rs.getString("senha"));
                us.setEmail(rs.getString("email"));
                us.setTelefone(rs.getString("telefone"));
                return us;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return null;
    }
    
    public Cartao pesquisarDadosCartaoCliente(int id) throws Exception {
    try {
            Cartao card = new Cartao();
            abrirBanco();
            String query = "SELECT * FROM cartao where cod_usuario=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                card.setId_clienteCartao(rs.getInt("cod_usuario"));
                card.setNumero(rs.getString("numero"));
                card.setTitular(rs.getString("titular"));
                card.setDataValidade(rs.getString("dataValidade"));
                card.setCvv(rs.getString("cvv"));
                return card;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return null;
    }
    
    public Endereco pesquisarEnderecoCliente(int id) throws Exception {
    try {
            Endereco end = new Endereco();
            abrirBanco();
            String query = "SELECT * FROM endereco where cod_usuario=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                end.setId_cliente(rs.getInt("cod_usuario"));
                end.setCep(rs.getString("cep"));
                end.setCidade(rs.getString("cidade"));
                end.setUf(rs.getString("uf"));
                end.setBairro(rs.getString("bairro"));
                end.setRua(rs.getString("rua"));
                end.setNumero(rs.getString("numero"));
                end.setComplemento(rs.getString("complemento"));
                end.setpRef(rs.getString("pRef"));
                return end;
            }
            fecharBanco();
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return null;
    }
    
    public void alterarDadosPessoais(Usuario us) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE usuario SET nome=?,senha=?,email=?,telefone=? WHERE codigo=?";
    pst = con.prepareStatement(query);
    pst.setString(1, us.getNome());
    pst.setString(2, us.getSenha());
    pst.setString(3, us.getEmail());
    pst.setString(4, us.getTelefone());
    pst.setInt(5, us.getCodigo());
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
    
    
    public void alterarDadosCartao(Cartao card) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE cartao SET numero=?,titular=?,dataValidade=?,cvv=? WHERE cod_usuario=?";
    pst = con.prepareStatement(query);
    pst.setString(1, card.getNumero());
    pst.setString(2, card.getTitular());
    pst.setString(3, card.getDataValidade());
    pst.setString(4, card.getCvv());
    pst.setInt(5, card.getId_clienteCartao());
    pst.executeUpdate();
    fecharBanco();
			
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
	}
    
    public void alterarEndereco(Endereco end) throws Exception {
       try {
    abrirBanco();
    String query = "UPDATE endereco SET cep=?,cidade=?,uf=?,bairro=?,rua=?,numero=?,complemento=?,pRef=? WHERE cod_usuario=?";
    pst = con.prepareStatement(query);
    pst.setString(1, end.getCep());
    pst.setString(2, end.getCidade());
    pst.setString(3, end.getUf());
    pst.setString(4, end.getBairro());
    pst.setString(5, end.getRua());
    pst.setString(6, end.getNumero());
    pst.setString(7, end.getComplemento());
    pst.setString(8, end.getpRef());
    pst.setInt(9, end.getId_cliente());
    pst.executeUpdate();
    fecharBanco();
			
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
          }
    }
    
    public boolean validarEmailsCadastrados(String emailDigitado) throws Exception {
    try {
            abrirBanco();
            String query = "SELECT * FROM usuario where email=?";
            pst = con.prepareStatement(query);
            pst.setString(1, emailDigitado);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
            
    } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
    }
    return false;
    }
       
}
