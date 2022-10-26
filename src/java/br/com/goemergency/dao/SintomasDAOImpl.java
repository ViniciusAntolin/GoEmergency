/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.goemergency.dao;

import br.com.goemergency.model.Sintomas;
import br.com.goemergency.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author windows
 */
public class SintomasDAOImpl {
    private Connection conn;

    public SintomasDAOImpl() throws Exception {
        try {
            conn = ConnectionFactory.conectar();
            System.out.println("Conectado com sucesso");
        } catch (Exception ex) {
            throw new Exception(ex.getMessage());
        }
    }

    public List<Sintomas> listar() {
        List<Sintomas> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select idsintoma, nomesintoma, partecorpo from sintomas;";
        try {
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Sintomas oSintoma = new Sintomas();
                oSintoma.setIdSintoma(rs.getInt("idsintoma"));
                oSintoma.setNomesintoma(rs.getString("nomesintoma"));
                oSintoma.setPartecorpo(rs.getString("partecorpo"));
                resultado.add(oSintoma);
            }
        } catch (SQLException ex) {
            System.out.println("Erro ao Listar SintomasDAOImpl \n Erro: " + ex.getMessage());
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
