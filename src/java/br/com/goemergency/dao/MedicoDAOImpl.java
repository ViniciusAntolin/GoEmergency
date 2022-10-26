/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.goemergency.dao;

import br.com.goemergency.model.Medico;
import br.com.goemergency.model.Pessoa;
import br.com.goemergency.util.ConnectionFactory;
import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Aluno
 */
public class MedicoDAOImpl implements GenericDAO {
    Connection conn;
    public MedicoDAOImpl() throws Exception {
        try{
            conn= ConnectionFactory.conectar();
            System.out.println("Conectado com sucesso");
        }catch(Exception ex){
            throw new Exception(ex.getMessage());
        }
    }
    
    public Integer cadastrar(Object object) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Integer idMedico = null;
        Medico oMedico = (Medico) object;


        String sql = "INSERT INTO Medico"
                + "(crm, ufcrm, especialidade, idpessoa)"
                + "VALUES (?, ?, ?, ?) RETURNING (idmedico)";
        
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, oMedico.getCrm());
            stmt.setString(2, oMedico.getUfcrm());
            stmt.setString(3, oMedico.getEspecialidade());
            try{
                stmt.setInt(4, new PessoaDAOImpl().cadastrar(oMedico));
            }catch(Exception ex){
                System.out.println("Erro ao cadastrar pessoa (Medico)");
            }
            
             rs = stmt.executeQuery();
            
            if(rs.next()){
                idMedico = rs.getInt("idMedico");
            }
        }catch(Exception ex){
            System.out.println("Erro ai salvar Medico(Pessoa) Erro:" + ex.getMessage());
            ex.printStackTrace();
        }finally{
            try{
                ConnectionFactory.fechar(conn, stmt, null);
            }catch(Exception ex) {
                System.out.println("Erro ao rechar conexao Erro:" + ex.getMessage());
                ex.printStackTrace();
            }
        }
        
        return idMedico;
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT p.*, m.idmedico, m.crm, m.ufcrm, m.especialidade"
                + " from pessoa p, Medico m"
                + " where p.idpessoa = m.idpessoa"
                + " and p.inactivatedat is null"
                + " and p.ismedico is true order by m.idmedico;";
        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Medico oMedico = new Medico();
                oMedico.setNome(rs.getString("nome"));
                oMedico.setCpf(rs.getString("cpf"));
                oMedico.setDatanascimento(rs.getDate("datanascimento"));
                oMedico.setEmail(rs.getString("email"));
                oMedico.setTelefone(rs.getString("telefone"));
                oMedico.setIdEndereco(rs.getInt("idendereco"));
                oMedico.setIdPessoa(rs.getInt("idpessoa"));
                
                oMedico.setCrm(rs.getString("crm"));
                oMedico.setUfcrm(rs.getString("ufcrm"));
                oMedico.setIdMedico(rs.getInt("idmedico"));
                oMedico.setEspecialidade(rs.getString("especialidade"));
                oMedico.setCreatedAt(rs.getDate("createdat"));
                oMedico.setUpdatedat(rs.getDate("updatedat"));
                
                resultado.add(oMedico);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Listar Medico \n Erro: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            //Fecha a conexão
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar parametros de conexao \n Erro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;
    }
    
    public List<Object> listar(String especialidade) {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT p.*, m.*"
                + " from pessoa p, Medico m"
                + " where p.idpessoa = m.idpessoa "
                + "and m.especialidade = ?"
                + " and p.inactivatedat is null"
                + " order by p.nome;";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, especialidade);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Medico oMedico = new Medico();
                oMedico.setIdPessoa(rs.getInt("idpessoa"));
                oMedico.setNome(rs.getString("nome"));
                oMedico.setCpf(rs.getString("cpf"));
                oMedico.setDatanascimento(rs.getDate("datanascimento"));
                oMedico.setEmail(rs.getString("email"));
                oMedico.setTelefone(rs.getString("telefone"));
                oMedico.setIdEndereco(rs.getInt("idendereco"));
                
                oMedico.setCrm(rs.getString("crm"));
                oMedico.setUfcrm(rs.getString("ufcrm"));
                oMedico.setIdMedico(rs.getInt("idMedico"));
                oMedico.setEspecialidade(rs.getString("especialidade"));
                
                resultado.add(oMedico);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Listar Medico \n Erro: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            //Fecha a conexão
            try {
                ConnectionFactory.fechar(conn, stmt, rs);
            } catch (Exception ex) {
                System.out.println("Erro ao fechar parametros de conexao \n Erro: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return resultado;
    }
    
    @Override
    public void excluir(int idObject) {
        PreparedStatement stmt = null;
        Medico oMedico = new Medico();
        Pessoa oPessoa = new Pessoa();
        
        String sql="Update pessoa set inactivatedat = current_timestamp where idpessoa=?;"
                +"COMMIT;"
                + "UPDATE m SET m.inactivatedAt = p.inactivatedAt " +
                    "FROM medico m INNER JOIN pessoa p ON "
                + "p.idpessoa = m.idpessoa where idpessoa = ?;";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            stmt.setInt(2, idObject);
            stmt.executeUpdate();
        }catch (Exception ex){
            System.out.println("Erro ao Excluir Medico \n Erro: "+ ex.getMessage());
            ex.printStackTrace();
        }finally {
            try{
                ConnectionFactory.fechar(conn, stmt, null);
            }catch(Exception ex){
                System.out.println("Erro ao fechar conexao \n Eroo: " + ex.getMessage());
                ex.printStackTrace();
            }
        }
    }

    @Override
    public Object carregar(int idObject) {
        Medico oMedico = new Medico();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT p.*, m.*, e.*"
                + " from pessoa p, medico m, endereco e"
                + " where p.idpessoa = m.idpessoa and p.idEndereco = e.idEndereco"
                + " and m.idpessoa = ? ORDER BY p.nome";

        try{
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idObject);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                oMedico.setIdPessoa(rs.getInt("idpessoa"));
                oMedico.setNome(rs.getString("nome"));
                oMedico.setCpf(rs.getString("cpf"));
                oMedico.setDatanascimento(rs.getDate("datanascimento"));
                oMedico.setEmail(rs.getString("Email"));
                oMedico.setTelefone(rs.getString("telefone"));
                oMedico.setIdEndereco(rs.getInt("idendereco"));
                        
                oMedico.setCrm(rs.getString("crm"));
                oMedico.setUfcrm(rs.getString("ufcrm"));
                oMedico.setIdMedico(rs.getInt("idMedico"));
                oMedico.setEspecialidade(rs.getString("especialidade"));
                }
            } catch (SQLException ex) {
                System.out.println("Erro ao Carregar Medico \n Erro: " + ex.getMessage());
                ex.printStackTrace();
            }finally{
                try{
                    ConnectionFactory.fechar(conn, stmt, null);
                }catch(Exception ex) {
                    System.out.println("Erro ao Fechar Conexão Erro:" + ex.getMessage());
                    ex.printStackTrace();
                }
            }
        
            return oMedico;
    }

    @Override
    public Boolean alterar(Object object) {
        PreparedStatement stmt = null;
        Medico oMedico = (Medico) object;
        
        String sql = "UPDATE Medico SET "
                + "crm = ?, ufcrm = ? "
                + "WHERE idpessoa = ?;";
                
        try{
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, oMedico.getCrm());
            stmt.setString(2, oMedico.getUfcrm());
            stmt.setInt(3, oMedico.getIdPessoa());
            
            stmt.executeUpdate();
            
            return true;
        }catch(Exception ex){
            System.out.println("Erro ao salvar Pessoa(Medico). Erro:"
                    + ex.getMessage());
            ex.printStackTrace();
            return false;
        }finally{
            try{
                ConnectionFactory.fechar(conn, stmt, null);
            }catch(Exception ex){
                System.out.println("Erro ao Fechar Conexão. Erro:"
                + ex.getMessage());
                ex.printStackTrace();
            }
        }      
    }
}
