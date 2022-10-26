/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.dao;

import br.com.goemergency.model.Mensagens;
import br.com.goemergency.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author windows
 */
public class MensagensDAOImpl {

    Connection conn;

    public MensagensDAOImpl() throws Exception {
        try {
            conn = ConnectionFactory.conectar();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }

    public Integer cadastrar(Object object) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Integer idMensagens = null;
        Mensagens oMensagens = (Mensagens) object;

        String sql = "Insert into mensagens (idchat, conteudo, isadministrative) values(?, ?, ?) "
                + "returning (idmensagem);";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, oMensagens.getIdChat());
            stmt.setString(2, oMensagens.getConteudo());
            stmt.setBoolean(3, oMensagens.getIsadministrative());
            
            rs = stmt.executeQuery();

            if (rs.next()) {
                idMensagens = rs.getInt("idmensagem");
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar Mensagens(MensagensDAO) Erro:" + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                ConnectionFactory.fechar(conn, stmt, null);
            } catch (Exception ex) {
                System.out.println("Erro ao rechar conexao Erro:" + ex.getMessage());
                ex.printStackTrace();
            }
        }

        return idMensagens;
    }

    public List<Object> listar(Object object) {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Mensagens oMensagens = (Mensagens) object;
        
        String sql = "select conteudo, isadministrative, createdat from "
                + "mensagens where idchat = ? "
                + "order by createdat asc;";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, oMensagens.getIdChat());
            rs = stmt.executeQuery();

            while (rs.next()) {
                Mensagens oMensagem = new Mensagens();
                
                oMensagem.setConteudo(rs.getString("conteudo"));
                oMensagem.setIsadministrative(rs.getBoolean("isadministrative"));
                oMensagem.setDatetomili(rs.getTimestamp("createdat").getTime());

                resultado.add(oMensagem);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Listar MensagensDAOImpl \n Erro: " + ex.getMessage());
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
}
