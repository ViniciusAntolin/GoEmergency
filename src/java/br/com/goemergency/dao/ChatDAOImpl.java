/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.dao;

import br.com.goemergency.model.Chat;
import br.com.goemergency.model.Pessoa;
import br.com.goemergency.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

 

public class ChatDAOImpl {

    Connection conn;

    public ChatDAOImpl() throws Exception {
        try {
            conn = ConnectionFactory.conectar();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }
    
    public class CustomObject{
        private Integer idchat;
        private Integer idpessoa;
        private String nome;

        public CustomObject() {
        }

        public CustomObject(Integer idchat, Integer idpessoa, String nome) {
            this.idchat = idchat;
            this.idpessoa = idpessoa;
            this.nome = nome;
        }

        public Integer getIdchat() {
            return idchat;
        }

        public void setIdchat(Integer idchat) {
            this.idchat = idchat;
        }

        public Integer getIdpessoa() {
            return idpessoa;
        }

        public void setIdpessoa(Integer idpessoa) {
            this.idpessoa = idpessoa;
        }

       

        public String getNome() {
            return nome;
        }

        public void setNome(String nome) {
            this.nome = nome;
        }
     
    }

    public Integer isValidChat(Object object) throws SQLException {
        PreparedStatement stmt = null;
        Integer idChat = null;
        ResultSet rs = null;
        Chat oChat = (Chat) object;

        String sql = "SELECT * from Chat"
                + " WHERE idmedico = ? and idpaciente = ?;";
        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, oChat.getIdmedico());
            stmt.setInt(2, oChat.getIdpaciente());
            rs = stmt.executeQuery();
            if (rs.next()) {
                idChat = rs.getInt("idchat");
            } else {
                return null;
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao verificar chat no banco (ChatDAO):"
                    + ex.getMessage());
            ex.printStackTrace();
            return null;
        }
        return idChat;
    }

    public Integer cadastrar(Object object) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Integer idChat = null;
        Chat oChat = (Chat) object;

        String sql = "Insert into Chat (idmedico, idpaciente) values(?, ?) returning (idchat);";

        try {
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, oChat.getIdmedico());
            stmt.setInt(2, oChat.getIdpaciente());

            rs = stmt.executeQuery();

            if (rs.next()) {
                idChat = rs.getInt("idChat");
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar Chat(ChatDAO) Erro:" + ex.getMessage());
            ex.printStackTrace();
        } 

        return idChat;
    }

    public List<Object> listar(Object object) {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Chat oChat = (Chat) object;
        String sql = "SELECT c.idpaciente, c.idchat , p.nome from Chat c "
                + "INNER JOIN pessoa p on p.idpessoa = c.idpaciente "
                + "WHERE idmedico = ?;";
        try { 
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, oChat.getIdmedico());
            rs = stmt.executeQuery();

            while (rs.next()) {
                CustomObject oObject = new CustomObject();
             
                oObject.setIdchat(rs.getInt("idchat"));
                oObject.setIdpessoa(rs.getInt("idpaciente"));
                oObject.setNome(rs.getString("nome"));

                resultado.add(oObject);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Listar ChatDAOImpl \n Erro: " + ex.getMessage());
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
