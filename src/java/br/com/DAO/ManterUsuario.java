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
    
}
